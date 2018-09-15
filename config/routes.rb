Rails.application.routes.draw do
  get 'posts/show'

  get 'home/new' => 'home#new'
  get 'posts/login/:id' => 'posts#login'
  get 'auth/entry/:provider/callback' => 'home#oauthLogin'#このpathを通して認証が行われる。
  post 'auth/entry/:provider/callback' => 'home#oauthLogin'#動くかわからんけど試しに
  get 'home/entry' => 'home#entry'
  get 'auth/post/:provider/callback' => 'posts#oauthLogin'
  post 'auth/post/:provider/callback' => 'posts#oauthLogin'
  post 'home/create' => 'home#create'
  get 'posts/error' => 'posts#error'

  root 'home#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

