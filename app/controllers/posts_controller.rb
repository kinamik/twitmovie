require "twitter"

class PostsController < ApplicationController

  def show

    @userTypeFlg = 0

    #視聴者のユーザー情報取得
    @user = session[:auth_user]

    #Postをセッションのidで取得
    puts("ポストid#{session[:post_id]}")
    @post  = Post.find_by(post_id:session[:post_id])

    #投稿者と視聴者が同じか判定
    puts("ポストの投稿者id#{@post}")
    puts("ログインユーザのid#{@user["uid"]}")
    if @post.post_user_id == @user["uid"]
      then @userTypeFlg = 1
    #違う場合はポストのユーザーのフォロー相手かを確認
      else
        #PostFriendをpost_idで検索し、複数取得したポストのユーザーのフォロー相手を視聴者のIDと判定する
        PostFriend.where(post_id:session[:post_id]).each do |postFriends|
          puts("ループ内#{postFriends.id}")
          #一致した場合
          if postFriends.friend_id == @user["uid"]
            then
              puts("できたよ#{postFriends.friend_id}")
              @userTypeFlg = 2

          end
        end
    end

    #投稿者でも投稿者のフォロー先でもなかった場合はエラーページへ遷移
    if @userTypeFlg == 0
      then
      redirect_to controller: 'posts', action: 'error'
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

  def error
  end

  #oauthのログイン時にする処理（画面表示はない）
  def oauthLogin
     #oauthのユーザ情報のセッションがあるか確認
    if session[:auth_user] == nil
      then
      #ない場合は取得する
      #ユーザー情報取得
        session[:auth_user] = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    end
    #記事に遷移
    redirect_to controller: 'posts', action: 'show'
  
  end




end
