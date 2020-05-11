Rails.application.routes.draw do
  root 'welcome#index'
  resources :users do
    resources :bookshelves
    resources :books, only: [:index]
  end
  resources :bookshelves
  resources :entries, only: [:destroy]
  resources :books do
    resources :entries, except: [:index, :destroy]
  end
  resources :genres, only: [:index, :show]
  resources :authors, only: [:index, :show]
  get '/search', to: 'books#search'
  get '/auth/google/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end