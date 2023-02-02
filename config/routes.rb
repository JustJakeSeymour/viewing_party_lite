Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'

  resources :users, only: [:show, :create] do
    resources :discover, only: [:index], controller: "users/discover"
    post "/movies", to: "users/movies#index"
    resources :movies, only: [:index, :show], controller: "users/movies"
  end
end
