Rails.application.routes.draw do

  root 'pages#home'

  get '/dashboard', to: 'agents#dashboard'
  get '/agents/:id', to: 'agents#show', as: 'agents'

  post '/agents/edit', to: 'agents#update'

  resources :properties

  devise_for  :agents, 
              path: '', 
              path_names: {sign_up: 'signup', sign_in: 'login', sign_out: 'logout', edit: 'update'},
              controllers: {registrations: 'registrations'} 

  get '/dashboard', to: 'agents#dashboard'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
