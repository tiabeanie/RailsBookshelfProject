Rails.application.routes.draw do
  root 'welcome#index'
  resources :users do
    get 'shows/behind', to: 'shows#behind'
    resources :watchlists
    resources :shows, only: [:index]
  end
  resources :bookshelves
  resources :entries, only: [:destroy]
  resources :books do
    resources :entries, except: [:index, :destroy]
  end
  resources :genres, only: [:index, :show]
  resources :authors, only: [:index, :show]
  get '/search', to: 'books#search'
  get '/auth/google/callback', to: 'users#google_login'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end