Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  get 'users/latest'
  get 'users/ranked'
  resources :users do
    resource :profile
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
