require 'sinatra'
require 'json'
require 'rest_client'

get '/:user' do
  @user = params[:user] || 'tksohishi'
  user_timeline_endpoint = "http://api.twitter.com/1/statuses/user_timeline.json"
  response = RestClient.get(user_timeline_endpoint, :params => { :screen_name => @user, :count => 20 })
  @tweets = JSON.parse(response.to_s)
  erb :user
end
