Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  resources :events
  match '/archive' => 'events#past', via: :get, as: :events_past
  # match '/search' => 'events#search', via: :get, as: :events_search
  resources :signups, only: [:create, :destroy, :update]
  match '/remove' => 'signups#remove', via: :post, as: :signup_remove
  resources :profiles

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
