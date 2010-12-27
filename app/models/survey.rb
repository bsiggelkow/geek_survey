class Survey < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  
  has_many :opinions, :dependent => :destroy
  belongs_to :user

  after_create :update_shortened_url

  validates_presence_of :question
  validates_presence_of :user

  def result
    opinions.inject(0) {|sum,opinion| sum += opinion.value}
  end

  def tweet
    user.twitter.update("#{question} #{shortened_url} #geeksurvey")
  end

  private
  def update_shortened_url
    update_attribute( :shortened_url, shorten_url )
  end

  def shorten_url
    Gus::Shortener.shorten( url_for(
      :host       => APP_CONFIG['app_host'],
      :controller => 'surveys',
      :action     => 'show',
      :id         => self.id)
    )
  end

end
