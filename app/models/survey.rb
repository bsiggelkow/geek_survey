class Survey < ActiveRecord::Base
  validates_presence_of :question
  has_many :opinions, :dependent => :destroy
  belongs_to :user
  
  def result
    opinions.inject(0) {|sum,opinion| sum += opinion.value}
  end

  def tweet
    user.twitter.update("#{question} #{link} #geeksurvey")
  end

  def link
    "http://geeksurvey.com/surveys/#{id}"
  end
end
