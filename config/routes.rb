Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  resources :events
  resources :signups, only: [:create, :destroy, :update]
  match '/remove' => 'signups#remove', via: :post, as: :signup_remove
  resources :profiles

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
