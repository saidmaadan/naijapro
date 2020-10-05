Rails.application.routes.draw do

  root 'pages#home'

  get '/dashboard', to: 'agents#dashboard'
  
  devise_for :agents, path: '', 
              path_names: {sign_up: 'signup', sign_in: 'login', edit: 'update', sign_out: 'logout'},
              controllers: {registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
