Rails.application.routes.draw do
  get 'home/new' => 'home#new'
  get 'auth/:provider/callback' => 'home#create'#このpathを通して認証が行われる。

  root 'home#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

