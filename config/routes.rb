Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'players#index'
  resources :players
  resources :comments, only: [:create]
  resources :seasons, only: [:create]
  
  resources :statuses, only: [:show]
  resources :positions, only: [:show]
  resources :profiles, only: [:show]
  resources :search, only: [:index, :new, :create, :show, :update]
  
  get 'resources/agents', to: "resources#agents"
  get 'resources/countries', to: "resources#countries"
  get 'resources/leagues', to: "resources#leagues"
  get 'resources/teams', to: "resources#teams"
  post 'resources/informations', to: "resources#player_informations"
end
