Rails.application.routes.draw do
  get 'course_orders/create'
  get 'course_orders/update'
  get 'course_orders/destroy'
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
  get "/buy", to: "orders#buy", as: "buy"
  get "/success", to: "orders#success", as: "success"
  get "/cancel", to: "orders#cancel", as: "cancel"
  get "/add_to_order/:id", to: "orders#add_to_order", as: "add_to_order"
  get "/shopping_cart", to: "orders#index", as: "orders"
  delete "/course/:id", to: "orders#destroy"

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
