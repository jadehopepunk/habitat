SimpleFormBootstrap::Application.routes.draw do
  devise_for :users
  
  namespace :admin do
    resources :users
  end
  resources :communities do
    get :autocomplete_community_name, :on => :collection
  end
  resources :uses, :features, :jobs, :project_categories, :soil_test_result_types, :soil_test_result_units

  resources :projects do
    resources :attachments, :path => '/:target_type/:target_id/attachments'
  end
  resources :sites do
    resources :patches, :soils
  end
  resources :soils do
    resources :soil_tests
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

  # mount Forem::Engine, :at => "/forums"

  match 'home', :to => 'home#index'
  root :to => 'home#index'
end
