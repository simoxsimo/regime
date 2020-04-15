Rails.application.routes.draw do
  get '/', to: 'static_pages#home', as: 'home' # as will create helper methods home_path & home_url
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/ext_nutriments', to: 'nutriments#no_group_index'
  get '/daily_nutriments', to: 'nutriments#index_daily'
  resources :users, only: [:show]
  resources :nutriments, only: [:new, :create, :index]
  resources :groups, only: [:new, :create, :show, :index]
  root to: 'static_pages#home'
end
