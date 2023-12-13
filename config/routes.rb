Rails.application.routes.draw do
  root 'main#index'
  get 'main/secret'
  get 'profile', to: 'users#show'
  get 'authored_meals', to: 'meals#authored_meals'

  post 'add_product', to: 'meals#add_product'
  post 'add_weight_measure', to: 'users#add_weight_measure'
  post 'calculate_nutrition_plan', to: 'users#calculate_nutrition_plan'

  resources :users, only: %i[index new create]
  resources :sessions, only: %i[new create destroy]
  resources :meals
  resources :products

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
