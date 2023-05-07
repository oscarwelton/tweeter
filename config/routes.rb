Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tweets#new"
  resources :tweets, only: [:new, :create, :edit, :update]
end
