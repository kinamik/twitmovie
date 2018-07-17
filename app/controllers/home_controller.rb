class HomeController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
# request.env['omniauth.auth']に、OmniAuthによってHashのようにユーザーのデータが格納されている。
    #session[:user_id] = user.id
    #redirect_to root_path, notice: "失敗しました。"
    @user = user
    redirect_to "/users/#{@user.username}"
  end
  
end
