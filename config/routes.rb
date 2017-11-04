Rails.application.routes.draw do
  
  root "zernikes#main"
  post "/compute", to: "zernikes#compute", as: "compute"
  get "/compute", to: "zernikes#compute"
  post "/update", to: "zernikes#update", as: "update"
  get "/manual", to: "zernikes#manual", as: "enter_manually"
  post "/random", to: "zernikes#random", as: "random"
  get "/", to: "zernikes#main", as: "home"
 
  match "/zernikes/upload" => "zernikes#upload", :as => "upload_zernike", via: [:get, :post]
  
  resources :zernikes
  
  get "/zernikes/image", to: "zernikes#get_image", as: "get_image"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # get  'new'    => 'zernike#new',   :as => 'new_zernike'


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
end
