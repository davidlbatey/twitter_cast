WatchTower::Application.routes.draw do
  
  get "tweets/index"

  resources :streams

  root :to => 'tweets#index'

end
