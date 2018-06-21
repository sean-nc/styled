Rails.application.routes.draw do
  devise_for      :users
  root            'static_pages#about'
  get             '/contact',             to: 'static_pages#contact'
end
