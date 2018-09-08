Rails.application.routes.draw do
  get 'posts/show'

  get 'home/new' => 'home#new'
  get 'posts/login/:id' => 'posts#login'
  get 'auth/entry/:provider/callback' => 'home#entry'#このpathを通して認証が行われる。
  post 'auth/entry/:provider/callback' => 'home#entry'#動くかわからんけど試しに
  get 'auth/post/:provider/callback' => 'posts#show'
  post 'auth/post/:provider/callback' => 'posts#show'
  post 'home/create' => 'home#create'
  get 'posts/error' => 'posts#error'

  root 'home#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

