# require 'oa-oauth'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, APP_CONFIG['twitter_api_key'], APP_CONFIG['twitter_api_secret']
end