SimpleFormBootstrap::Application.routes.draw do
  devise_for :users
  
  namespace :admin do
    resources :users
  end
  resources :uses
  resources :sites do
    resources :goals
    resources :labour_input_goals
    resources :yield_goals do
      get :autocomplete_use_name, :on => :collection
    end
  end

  root :to => 'home#index'
end
