Rails.application.routes.draw do
  root        'static_pages#about'
  get         '/contact',         to: 'static_pages#contact'
end
