Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :maps, only: [:index]
  resources :tweets, only: [:new,:create,:index,:show,:destroy]
end
