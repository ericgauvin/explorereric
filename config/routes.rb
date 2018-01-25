Rails.application.routes.draw do
  get 'welcome/index'
  get '/countries/countries', :as => 'countries_page'
  
  resources :photos

  root 'welcome#index'
  root 'countries#show', countries: 'countries'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
