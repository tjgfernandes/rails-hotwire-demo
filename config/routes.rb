Rails.application.routes.draw do
  get 'time'=> 'time#index', as: :time_zones
  get 'time/:id'=> 'time#show', as: :time_zone
  get 'time/:id/one'=> 'time#show_one', as: :one_time_zone


  resources :i_todos
  resources :todos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "time#index"
end
