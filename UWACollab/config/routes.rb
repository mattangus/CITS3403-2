Rails.application.routes.draw do

  get '/calendar(/:year(/:month))', to: 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  root :controller => 'application', :action => 'index'
  post '/', to: 'sessions#create'
 # get '/', to: 'application#index', as: 'home'
  get '/login', to: 'application#index'

  get '/workspace', to: 'application#workspace', :files => false
  get '/workspace/files', to: 'application#workspace', :files => true
  delete '/workspace', to: 'sessions#destroy'

  get '/register', to: 'application#register'

  get '/project/:name', to: 'application#project', :files => false
  get '/project', to: 'application#project', :files => true
  get '/newProject', to: 'application#project', :new => true
  post '/newProject', to: 'groups#new'

  get '/messages', to: 'messages#index'
  post '/messages', to: 'messages#create'

  UWACollab::Application.routes.draw do
    controller :sessions do
      get 'login' => :new
      post 'login' => :create
      delete 'logout' => :destroy
    end
    # Skipped other routes definitions
  end

  delete '/workspace', to: 'application#index'

  get '/users', to: 'users#new'
  post '/users', to: 'users#create'

  #resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'application#index'

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
