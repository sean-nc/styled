Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'users/index'
  get 'users/show'
  devise_for      :users
  root            'static_pages#about'
  get             '/contact',             to: 'static_pages#contact'
  resources       :users,                 only: [:index, :show] do
    member do
      get         :following, :followers
    end
  end
  resources       :relationships,         only: [:create, :destroy]
end
