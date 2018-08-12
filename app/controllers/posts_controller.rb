require "twitter"

class PostsController < ApplicationController
  def show

    #ここでもauth/:provider/callbackを利用したい。しかしそれではhome/entryに移動してしまう。どうすべきか・・・



    




    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end

    uid = params[:id]
    @arrIds = Array.new
    @arrIds = client.friend_ids('henktrenkt')

  end
end
