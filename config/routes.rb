Rails.application.routes.draw do
  devise_for      :users
  root            'static_pages#about'
  get             '/contact',             to: 'static_pages#contact'
  get             '/find_users',           to: 'static_pages#find_users'
  get             '/vote',                to: 'static_pages#vote'
  get             '/explore',             to: 'static_pages#explore'

  resources       :users,                 only: :show do
    member do
      get         :following, :followers
    end
    resources     :posts,                 only: [:show, :new, :create, :destroy, :edit, :update] do
      resources   :clothing_articles,     only: [:new, :create, :destroy, :edit, :update]
      resources   :comments,              only: [:new, :create, :destroy]
    end
  end

  resources       :relationships,         only: [:create, :destroy]
  resources       :likes,                 only: [:create, :destroy]
  resources       :votes,                 only: :create
  resources       :messages,              only: :create
end
