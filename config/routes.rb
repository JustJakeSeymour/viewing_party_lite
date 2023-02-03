Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'

  resources :users, only: %i[show create] do
    scope module: :users do
      post '/movies', to: 'movies#index'
    end
    resources :discover, only: [:index], controller: 'users/discover'
    resources :movies, only: %i[index show], controller: 'users/movies' do
      resources :viewing_parties, only: %i[new create], controller: 'users/movies/viewing_parties'
    end
  end
end
