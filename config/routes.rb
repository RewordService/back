Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'auth/registrations'
    }
  put 'user/profile', to: 'profiles#update'
  patch 'user/profile', to: 'profiles#update'

  put 'user/reword', to: "rewords#update"
  patch 'user/reword', to: "rewords#update"

  resources :users, only: %i(index show) do
    collection do
      get 'latest'
      get 'ranked'
    end
  end

  get 'reword/info', to: "rewords#info"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
