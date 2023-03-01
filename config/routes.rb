Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :beasts, only: %i[index new create show destroy] do
    resources :bookings, only: %i[new create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
  get "/dashboard", to: "pages#dashboard"
end
