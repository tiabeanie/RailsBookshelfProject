Rails.application.routes.draw do
  resources :book_genres
  resources :bookshelves
  resources :users
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
