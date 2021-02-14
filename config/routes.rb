Rails.application.routes.draw do
  scope :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'auth/registrations',
    }
    put 'user/reword', to: "rewords#update"
    patch 'user/reword', to: "rewords#update"
    get 'user/reword', to: "rewords#show"

    resources :users, only: %i(index show) do
      collection do
        get 'latest'
        get 'ranked'
      end
    end
    resources :contacts, only: :create

  end
  get 'reword/info', to: "rewords#info"
    get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
  get '/sitemap', to: redirect(https://reword.s3-ap-northeast-1.amazonaws.com/sitemaps/sitemap.xml.gz)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
