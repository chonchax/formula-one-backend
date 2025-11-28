Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
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

      resources :results, only: [:create, :update, :destroy]
    end
  end
end
