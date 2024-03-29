Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :conversations do
    resources :messages
  end
  root to: 'subjects#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/tutors', to: 'users#tutors_index', as: 'tutors'
  get '/students', to: 'users#students_index', as: 'students'
  get '/students/:id', to: 'users#students_show', as: 'student'
  get '/course/:tutor_id', to: 'courses#show', as: 'course'
  get '/course/:id/edit', to: 'courses#edit', as: 'edit_course'
  get '/subject/:id', to: 'subjects#show', as: 'subject'
  get '/buy', to: 'orders#buy', as: 'buy'
  get '/success', to: 'orders#success', as: 'success'
  get '/cancel', to: 'orders#cancel', as: 'cancel'
  get '/add_to_order/:id', to: 'orders#add_to_order', as: 'add_to_order'
  get '/shopping_cart', to: 'orders#shopping_cart', as: 'shopping_cart'
  get '/order/:student_id', to: 'orders#index', as: 'orders'
  get '/courses/new', to: 'courses#new', as: 'new_course'
  post '/courses', to: 'courses#create'
  patch '/course/:id', to: 'courses#update'
  delete '/course_order/:id', to: 'orders#destroy'
  delete '/course/:id/', to: 'courses#destroy'
  get '/course_orders/create'
  put '/course_orders/update', to: 'course_orders#update', as: 'course_orders_update'
  delete '/course_order/:course_id/destroy', to: 'course_orders#destroy', as: 'destroy_course_order'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
