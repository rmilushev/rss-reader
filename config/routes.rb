Rails.application.routes.draw do
  resources :locations
  get 'articles', to: 'articles#index'
  root to: 'locations#index'
end
