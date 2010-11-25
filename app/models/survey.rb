class Survey < ActiveRecord::Base
  validates_presence_of :question
  has_many :opinions, :dependent => :destroy
  
  def result
    opinions.inject(0) {|sum,opinion| sum += opinion.value}
  end
end
