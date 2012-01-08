SimpleFormBootstrap::Application.routes.draw do
  devise_for :users
  
  namespace :admin do
    resources :users
  end
  resources :uses
  resources :jobs
  resources :project_categories
  resources :projects do
    resources :goals
    namespace :goals do
      resources :yields do
        get :autocomplete_use_name, :on => :collection
      end
      resources :labour_inputs do
        get :autocomplete_job_name, :on => :collection
      end
      resources :budget_items do
        get :autocomplete_budget_category_name, :on => :collection
      end
    end
  end

  mount Forem::Engine, :at => "/forums"

  root :to => 'home#index'
end
