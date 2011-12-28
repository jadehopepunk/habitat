SimpleFormBootstrap::Application.routes.draw do
  devise_for :users
  
  namespace :admin do
    resources :users
  end

  resources :sites do
    resources :goals
  end
  
  root :to => 'sites#index'
end
