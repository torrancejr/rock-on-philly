Rails.application.routes.draw do
  root "venues#index"
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :venues, only: [:show] do
        resources :reviews, only: [:create] do
          resources :votes, only: [:create]
          end
        end
      end
    end


  namespace :admin do
    resources :venues
    resources :users
  end

  resources :venues do
    resources :reviews
  end
end
