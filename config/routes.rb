Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :beasts, only: %i[index new create show destroy] do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[] do
    member do
      post "bookings/:id/accept", to: "bookings#accept", as: :accept
      # patch :accept
      post "bookings/:id/decline", to: "bookings#decline", as: :decline
      # patch :decline
      post "bookings/:id/cancel", to: "bookings#cancel", as: :cancel
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
  get "/dashboard", to: "pages#dashboard"
end
