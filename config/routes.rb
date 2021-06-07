Rails.application.routes.draw do
  resources :tvits
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "tvits#index"
end
