Rails.application.routes.draw do
  mount           ActionCable.server => '/cable'
  root            'static_pages#home'
  get             '/about',               to: 'static_pages#about'
  get             '/contact',             to: 'static_pages#contact'
  get             '/find_users',          to: 'static_pages#find_users'
  get             '/vote',                to: 'static_pages#vote'
  get             '/explore',             to: 'static_pages#explore'
  get             '/hot',                 to: 'static_pages#hot'
  devise_for      :users

  resources       :users,                 only: :show do
    member do
      get         :following, :followers, :liked_photos
    end
    resources     :chats,                 only: [:index, :show, :create]
    resources     :posts,                 only: [:show, :new, :create, :destroy, :edit, :update] do
      resources   :clothing_articles,     only: [:new, :create, :destroy, :edit, :update]
      resources   :comments,              only: [:new, :create, :destroy]
    end
  end

  resources       :relationships,         only: [:create, :destroy]
  resources       :likes,                 only: [:create, :destroy]
  resources       :votes,                 only: :create
  resources       :messages,              only: :create
  resources       :msgs,                  only: :create
end
