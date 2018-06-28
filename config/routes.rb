Rails.application.routes.draw do
  devise_for      :users
  root            'static_pages#about'
  get             '/contact',             to: 'static_pages#contact'
  get             '/add_users',           to: 'static_pages#add_users'
  get             '/vote',                to: 'static_pages#vote'

  resources       :users,                 only: [:index, :show] do
    member do
      get         :following, :followers
    end
    resources     :posts,                 only: [:show, :new, :create, :destroy, :edit, :update] do
      resources   :clothing_articles,     only: [:new, :create, :destroy, :edit, :update]
    end
  end
  resources       :relationships,         only: [:create, :destroy]
  resources       :likes,                 only: [:create, :destroy]
  resources       :votes,                 only: :create
end
