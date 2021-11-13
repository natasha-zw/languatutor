Rails.application.routes.draw do
  devise_for :users
  # resources :orders
  # resources :courses
  resources :users
  root to: "subjects#index"
  get "/test", to: "subjects#test"
  get "/tutors", to: "users#index", as: "tutors"
  get "/course/:tutor_id", to: "courses#show", as: "course"
  get "/course/:id/edit", to: "courses#edit", as: "edit_course"
  get "/subject/:id", to: "subjects#show", as: "subject"
  get "/buy/:id", to: "orders#buy", as: "buy"
  get "/success", to: "orders#success", as: "success"
  get "/cancel", to: "orders#cancel", as: "cancel"
  get "/shopping_cart", to: "orders#index", as: "orders"

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
