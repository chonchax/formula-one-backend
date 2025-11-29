Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      devise_for :users,
        path: "",
        only: [ :sessions ],
        controllers: {
          sessions: "api/v1/sessions"
        },
        defaults: { format: :json }

      resources :drivers, only: [ :create, :index, :update, :destroy ] do
        collection do
          get :ranking
        end
      end

      resources :teams, only: [ :index, :show ]

      resources :races, only: [ :index ] do
        resources :race_editions, only: [ :index ]
      end

      resources :race_editions, only: [] do
        get :results, on: :member
      end
      resources :results, only: [ :create, :update, :destroy ]
    end
  end
end
