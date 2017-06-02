Rails.application.routes.draw do

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


  #Start my app code

  #make todo_list index the root of the application
  root to: "todo_lists#index"
    #nest resources of todo_items inside of todo_lists, resources passed to 
    #todo_items will always have todo_list in them
  resources :todo_lists do
    #notes only need create and destroy because edit and new will
    #be in the book show
    #resources :todo_item, only: [:create, :destroy]  
    resources :todo_items 
  end

  resources :sessions, only: [:new, :create, :destroy]

  #resources :profiles #not sure if used
  #resources :users #not sure if used
  #sessions resource, it is temporary
  #resources :sessions, only: [:new, :create, :destroy]

  #get request to login page, should go to sessions controller, new action and we refer
  #to this as login. So we'll have login_path or login_url
  #map the GET /login action to sessions new, refer to as login, rake routes reports login_path helper
  get "/login" => "sessions#new", as: "login"
  #map the DELETE /logout action to sessions destroy, refer to as logout, rake routes reports logout_path helper
  delete "/logout" => "sessions#destroy", as: "logout"


end
