Rails.application.routes.draw do

  get 'auth/register', to: 'auth#register', as: 'register'
  post 'auth/register', to: 'auth#add_user', as: 'add_user'

  get 'auth/login', to: 'auth#login', as: 'login'
  post 'auth/login', to: 'auth#authenticate', as: 'authenticate'

  delete 'auth/logout', to: 'auth#logout'

  get 'dashboard', to: 'dashboard#dashboard'
  get 'dashboard/index', to: 'dashboard#dashboard'

  # Root route
  root 'welcome#index'

  get 'welcome/check_db', to: 'welcome#check_db'

end
