Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :maps, only: [:index]
end
