SimpleFormBootstrap::Application.routes.draw do
  devise_for :users
  
  namespace :admin do
    resources :users
  end
  resources :communities do
    get :autocomplete_community_name, :on => :collection
  end
  resources :uses
  resources :features
  resources :jobs
  resources :project_categories
  resources :projects do
    resource :site_analysis
    resources :scopes, :only => [] do
      resources :attachments
    end
  end
  namespace :site_analysis do
    resources :projects do
      resources :areas
      resources :soil_tests
    end
  end

  resources :briefs do
    namespace :goals do
      resources :yields do
        get :autocomplete_use_name, :on => :collection
      end
      resources :features do
        get :autocomplete_feature_name, :on => :collection
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
