Rails.application.routes.draw do
  root 'articles#index'

  #pages
  get '/home' => 'pages#home'
  get '/dashboard' => 'pages#dashboard'

  #users
  get "/account" => "users#index", as: "user_account"
  get "/signup" => "users#new", as: 'new_user'
  post "/signup" => "users#create", as: 'create_user'
  delete "/account/:id" => "users#destroy", as: 'delete_user'
  
  #sesion
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: 'delete_session'

  #articles
  get '/articles' => 'articles#index'
  get '/articles/new' => 'articles#new', as: 'new_article'
  post '/articles/new' =>'articles#create', as: 'create_article'
  get '/articles/name/:name' => 'articles#find_name', as: 'find_article'
  get '/articles/:id/edit' => 'articles#edit', as: 'edit_article'
  get '/articles/:id' => 'articles#show', as: 'show_article'
  patch '/articles/:id/edit' => 'articles#update', as: 'update_article'
  delete '/articles/:id' => 'articles#delete', as: 'delete_article'

  #comments
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
end
