Rails.application.routes.draw do
  resources :glucose_levels
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "glucose_levels#new"
  root 'welcome#index'
  get 'unauthorized', to: 'home#index'
end
