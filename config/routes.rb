Rails.application.routes.draw do

  get '/dashboard', to: 'agents#dashboard'
  root 'pages#home'

  devise_for :agents, path: '', 
              path_names: {sign_up: 'signup', sign_in: 'login', edit: 'update', sign_out: 'logout'},
              controllers: {registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
