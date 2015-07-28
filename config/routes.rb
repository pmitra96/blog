Rails.application.routes.draw do

  #devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
   devise_for :users, path: "blog", controllers: {sessions: "users/sessions", registrations: "users/registrations", passwords: "users/passwords", confirmations: "users/confirmations", unlocks: "users/unlocks"}, path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'user/registration'}
  get 'welcome/index'
  resources :articles do
     collection do 
      get 'user_articles'
      post 'user_articles'
    end
   
    collection do 
      get 'my_articles'
      post 'my_articles'
    end
   
     collection do 
      get 'user_likes'
      post 'user_likes'
    end
    collection do 
      get 'user_unlikes'
      post 'user_unlikes'
    end
    collection do 
      get 'user_follow'
      post 'user_follow'
    end
     collection do 
      get 'user_unfollow'
      post 'user_unfollow'
    end
     collection do 
      get 'newsfeed'
      post 'newsfeed'
    end
    resources :comments
end
 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'articles#index'

get "home/index"



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
