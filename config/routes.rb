Rails.application.routes.draw do
  resources :friendships
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :tvits

  get 'user', to: 'users#show', as: 'users_tvits'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tvits#index'

end
