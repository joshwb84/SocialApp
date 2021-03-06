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
 #root to: 'pages#home'
 #get '/about', to: 'pages#about'
 #get '/signin', to: 'pages#signin'
 #get '/terms', to: 'pages#terms'
#end
#Bootstrap::Application.routes.draw do - removed this because it was in the example but I dont need it

resources :events do
  resources :reservations
end
resources :users
resources :sessions


# Static Pages
  get '/about', to: 'home#about', :as => "about"
  get '/terms', to: 'home#terms', :as => "terms"
  get '/contact', to: 'home#contact', :as => "contact"
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'
  get '/home', to: redirect('/')
  root :to => 'home#home'

#  get '/signin'   => 'high_voltage/pages#show', id: 'signin'
  get '/blog', to: 'home#blog', :as => "blog"
#  get '/create'     => 'high_voltage/pages#show', id: 'create'

  

end