Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'mypages' => 'maps#mypage', as: 'mypages'
  resources :maps, only: %i[index show] do
    resource :bookmarks, only: %i[create destroy]
    resource :counts, only: %i[create destroy]
    resources :map_comments, only: %i[create destroy]
  end
  resources :tweets, only: %i[new create index show edit destroy update] do
    resource :favorites, only: %i[create destroy]
    resources :tweet_comments, only: %i[create destroy]
  end
  resources :users, only: %i[index show edit update] do
    resource :relationships, only: %i[create destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  namespace :admin do
    resources :maps, only: %i[index new show create destroy]
  end
end
