SimpleFormBootstrap::Application.routes.draw do
  devise_for :users
  
  namespace :admin do
    resources :users
  end
  resources :uses
  resources :sites do
    resources :goals
    resources :yield_goals
  end
  
  root :to => 'home#index'
end
