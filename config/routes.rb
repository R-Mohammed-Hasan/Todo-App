Rails.application.routes.draw do

  root "home#index"



  post "todos", to: "todos#create"



  get "todos", to: "todos#todo"



  put "todos/:id", to: "todos#update"



  delete "todos/:id", to: "todos#destroy"



  get "todos/:id", to: "todos#show"



  get "users/create", to: "users#new"



  post "users", to: "users#create"



  get "users/login", to: "sessions#new"



  post "users/login", to: "sessions#create"



  delete "users/signout", to: "sessions#destroy"

end

