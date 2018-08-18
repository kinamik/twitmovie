require "twitter"

class PostsController < ApplicationController

  def show

    #視聴者のユーザー情報取得
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])

    #Postをセッションのidで取得
    post  = Post.find_by(post_id:session[:post_id])

    #ポストのユーザーのフォロー相手かを確認
    #PostFriendをpost_idで検索し、複数取得したポストのユーザーのフォロー相手を視聴者のIDと判定する
    PostFriend.where(post_id:session[:post_id]).each do |postFriends|
      puts("ループ内#{postFriends.id}")
      #一致した場合
      if postFriends.friend_id == user.uid
        then puts("できたよ#{postFriends.friend_id}")
      end
    end

  end

  def login

    #Postをパラメータのidで取得
    post  = Post.find_by(post_id:params[:id])

    #REST API取得
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end
    #投稿者のユーザー名取得
    @postUsername = client.user(user_id:post.post_user_id).name

    #セッションにポストid設定（oathから帰ってきた時にidを取得するため）
    session[:post_id] = params[:id]
    

  end



end
