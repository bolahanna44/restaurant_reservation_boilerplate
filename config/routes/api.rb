namespace :api, defaults: { format: :json } do
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'

    resources :restaurants, except: %i[new edit]
    resources :reservations, except: %i[new edit]
  end
end
