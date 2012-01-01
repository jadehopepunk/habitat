SimpleFormBootstrap::Application.routes.draw do
  devise_for :users
  
  namespace :admin do
    resources :users
  end
  resources :uses
  resources :jobs
  resources :projects do
    resources :goals
    resources :labour_input_goals do
      get :autocomplete_job_name, :on => :collection
    end
    resources :yield_goals do
      get :autocomplete_use_name, :on => :collection
    end
    resources :budget_goals do
      get :autocomplete_budget_category_name, :on => :collection
    end
  end

  mount Forem::Engine, :at => "/forums"

  root :to => 'home#index'
end
