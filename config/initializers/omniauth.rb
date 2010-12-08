# require 'oa-oauth'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'MZNApF2jR4DL5oePdVlg', '8yUe0ggZQ2TTjInnzPbhoypU3AeKnazhXahATcYYs'
end