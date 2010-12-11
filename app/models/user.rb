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

  def twitter
    configure_twitter!
    Twitter::Client.new
  end

  def configure_twitter!
    Twitter.configure do |config|
      # TODO: Figure out better way of getting app key and secret
      config.consumer_key       = "MZNApF2jR4DL5oePdVlg"
      config.consumer_secret    = "8yUe0ggZQ2TTjInnzPbhoypU3AeKnazhXahATcYYs"
      config.oauth_token        = access_token
      config.oauth_token_secret = access_secret
    end
  end
      
end
