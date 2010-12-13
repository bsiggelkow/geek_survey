class User < ActiveRecord::Base
  class << self
    def create_with_omniauth(auth)
      create! do |user|
        user.provider      = auth["provider"]
        user.uid           = auth["uid"]
        user.name          = auth["user_info"]["name"]
        user.access_token  = auth['credentials']['token']
        user.access_secret = auth['credentials']['secret']
      end
    end
  end
  
  has_many :surveys, :dependent => :destroy

  def twitter
    configure_twitter!
    Twitter::Client.new
  end

  def configure_twitter!
    Twitter.configure do |config|
      config.consumer_key       = APP_CONFIG['twitter_api_key']
      config.consumer_secret    = APP_CONFIG['twitter_api_secret']
      config.oauth_token        = access_token
      config.oauth_token_secret = access_secret
    end
  end
      
end
