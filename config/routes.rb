Rails.application.routes.draw do

  resources :photos
  resources :users
  
  get 'welcome/index'
  get 'countries', :to => 'countries#show'

  root 'welcome#index'
  root 'countries#show', countries: 'countries'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
