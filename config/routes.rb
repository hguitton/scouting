Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'players#root'
  resources :players do 
    member do
      get 'active', to: "players#active"
    end
  end
  resources :comments, only: [:create]
  resources :seasons, only: [:create]
  
  resources :statuses, only: [:show]
  resources :positions, only: [:show]
  resources :profiles, only: [:show]
  resources :search, only: [:index, :new, :create, :show, :update]
  resources :rosters do
    member do
      get 'duplicate', to: "rosters#duplicate", as: :duplicate
      post 'add_player/:player_id', to: "rosters#add_player", as: :add_player
      post 'remove_player/:player_id', to: "rosters#remove_player", as: :remove_player
    end
    resources :spots, controller: :roster_spots, only: [:create, :update, :destroy] do
      member do
        post 'update_players'
      end
    end
  end
  resources :users do 
    member do
      get :favorites
      post 'add_favorite/:player_id', to: "users#add_fav_player", as: :add_favorite
      post 'remove_favorite/:player_id', to: "users#remove_fav_player", as: :remove_favorite
    end
  end
  get 'resources/agents', to: "resources#agents"
  get 'resources/countries', to: "resources#countries"
  get 'resources/leagues', to: "resources#leagues"
  get 'resources/teams', to: "resources#teams"
  post 'resources/informations', to: "resources#player_informations"
end
