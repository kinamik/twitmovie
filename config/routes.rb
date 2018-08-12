Rails.application.routes.draw do
  get 'posts/show'

  get 'home/new' => 'home#new'
  get 'posts/:id' => 'posts#show'
  get 'auth/:provider/callback' => 'home#entry'#このpathを通して認証が行われる。
  post 'auth/:provider/callback' => 'home#entry'#動くかわからんけど試しに
  post 'home/create' => 'home#create'

  root 'home#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

