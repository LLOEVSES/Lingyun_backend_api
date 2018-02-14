require 'api_version'

Rails.application.routes.draw do
  mount_devise_token_auth_for 'Customer', at: 'customer_auth'
  mount_devise_token_auth_for 'Worker', at: 'worker_auth'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # namespace :v1 do
  #   resources :customers
  # end
  scope defaults: { format: 'json' } do
      scope module: :v1 do#, constraints: { subdomain: 'api' } do#, constraints: ApiVersion.new('v1', true) do
          resources :customers
          resources :events do
              member do
                  get 'accepted'
                  get 'processing'
              end
          end
          resources :workers
          resources :customer_events
          #resources :customers_tokens, :only => [:create, :destroy]

      end
  end


end
