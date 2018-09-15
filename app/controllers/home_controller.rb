require "twitter"


class HomeController < ApplicationController
  def new
  end

  def create
    #post_idのインスタンス変数（URLに使用するためここで宣言）
    @pid = nil

    #セッションよりoauthユーザー情報を取得
    postUser = session[:auth_user]

    #postsの登録
    #ユニークとなるpost_idを生成する
    loop{
      @pid = SecureRandom.hex(10)
      #Postsを生成したpost_idで検索し、存在しなければ登録してループを抜ける
      if !Post.find_by(post_id:@pid) then
        #contentにはviewにて入力した文字列、post_user_idには取得したユーザーid、post_idには生成したidを設定
        posts = Post.new(content:params['input_content'],post_user_id:postUser["uid"],post_id:@pid)
        posts.save
        break
      end
    }
    

    #post_friendsの登録
    #TwitterAPIクラスの取得（ominiauthではない）
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end

    arrIds = Array.new
    #投稿者のidからフォロー相手（フォロワーではない）のリストを取得
    arrIds = client.friend_ids(user_id:postUser["uid"])

    puts "ポストID確認#{@pid}"

    #ループしてpostFriendを登録
    arrIds.each do |ids|
      postFriend  = PostFriend.new(post_id:@pid,post_user_id:postUser["uid"],friend_id:ids)
      postFriend.save
    end

    #postsに移動
    redirect_to controller: 'posts', action: 'login', id: @pid
  end


  #記事作成アクション（元々はログイン処理を行うアクションだったため、名前がentry）
  def entry

    #セッションよりoauthユーザー情報を取得
    postUser = session[:auth_user]
    #ユーザー名
    @nickname = postUser["username"]
    #アイコン
    @image_url = postUser["image_url"]

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
    #作成画面に遷移
    redirect_to controller: 'home', action: 'entry'

  end




end
