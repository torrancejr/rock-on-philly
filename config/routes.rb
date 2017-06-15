Rails.application.routes.draw do
  root "venues#index"
  devise_for :users

  namespace :admin do
    resources :venues
    resources :users
  end

  resources :venues do
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
