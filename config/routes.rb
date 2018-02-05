require 'api_version'

Rails.application.routes.draw do
  mount_devise_token_auth_for 'Customer', at: 'cusauth'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # namespace :v1 do
  #   resources :customers
  # end
  scope defaults: { format: 'json' } do
      scope module: :v1 , constraints: { subdomain: 'api' } do#, constraints: ApiVersion.new('v1', true) do
          resources :customers
          resources :events
          resources :workers
          #resources :customers_tokens, :only => [:create, :destroy]

      end
  end


end
