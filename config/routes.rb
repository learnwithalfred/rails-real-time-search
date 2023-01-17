Rails.application.routes.draw do
  get 'searches/index'
  resources :articles
  root "articles#index"
end
