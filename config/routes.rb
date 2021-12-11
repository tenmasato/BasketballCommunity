Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :maps, only: [:index]
  resources :tweets, only: [:new,:create,:index,:show,:destroy]do
    resource :favorites,only: [:create,:destroy]
    resources :tweet_comments,only: [:create,:destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  namespace :admin do
    resources :maps, only: [:index,:new,:show,:create,:destroy]
  end
end
