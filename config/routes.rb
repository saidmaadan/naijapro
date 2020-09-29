Rails.application.routes.draw do
  devise_for :agents
  root 'pages#home'
  
end
