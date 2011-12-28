SimpleFormBootstrap::Application.routes.draw do
  devise_for :users

  resources :sites do
    resources :goals
  end
  
  root :to => 'sites#index'
end
