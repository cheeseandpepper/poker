Rails.application.routes.draw do
  resources :players,  only: [:index]
  resources :games,    only: [:index]
  resources :hands,    only: [:index]
  resources :searches, only: [:index]  
  root "games#index"
end
