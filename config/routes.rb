Rails.application.routes.draw do
  resources :preferences, only: [:index, :show, :edit, :update, :new, :create, :destroy] do
    member do
      post 'add_question'
      delete 'delete_question/:question_id', to: 'preferences#delete_question', as: 'delete_question'
      get 'edit_question/:question_id', to: 'preferences#edit_question', as: 'edit_question'
      patch 'update_question/:question_id', to: 'preferences#update_question', as: 'update_question'
    end
  end
  
  # MCP routes are automatically mounted at /mcp
  get 'mcp/dashboard', to: 'mcp#dashboard', as: 'mcp_dashboard'
  get 'mcp/docs', to: 'mcp#docs', as: 'mcp_docs'
  
  # Root route
  root "preferences#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
