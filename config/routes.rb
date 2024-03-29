Rails.application.routes.draw do

  resources :buses

  resources :routes

  resources :stops

  devise_for :users
  unauthenticated do
    root to: 'welcome#index'
  end

  authenticated :user do
    root to: 'users#index', as: :user_root
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
      end
      
      resources :stops, only: [:index] do
        resources :buses, only: [:index]
      end

      resources :buses, only: [:show]
      resources :users, only: [:index, :update]
      #resources :balance_reloads, only: [:create]
      #resources :ticket_payments, only: [:create]
      
      patch '/balance_reloads' => 'balance_reloads#create' , :as => 'create_balance_reloads'
      patch '/ticket_payments' => 'ticket_payments#create' , :as => 'create_ticket_payments'
      
      patch '/buses/position' => 'buses#update_position', :as => 'buses_update_position'
    end
  end
end
