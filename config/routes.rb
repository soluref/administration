Rails.application.routes.draw do

  get 'static_pages/home'

  get 'static_pages/help'

  get 'services/index'

  get 'services/edit'

  get 'services/show'

  get 'services/new'

  get 'pdfs/index'

  get 'pdfs/edit'

  get 'pdfs/show'

  get 'pdfs/new'

  get 'pages/index'

  post 'pages', to:'pages#destroy'

  get 'pages/edit'

  get 'pages/show'

  get 'pages/new'

  get 'newsletterinscrits/index'

  get 'newsletterinscrits/edit'

  get 'newsletterinscrits/show'

  get 'newsletterinscrits/new'

  get 'entites/index'

  get 'entites/edit'

  get 'entites/show'

  get 'entites/new'

  get 'articles/index'

  get 'articles/edit'

  get 'articles/show'

  get 'articles/new'

  get 'actualites/index'

  post 'actualites/edit'

  get 'actualites/show'

  get 'actualites/new'

  get 'acces/index'

  get '/acces/:id', to: 'acces#show'

  get 'acces/edit:id', to: 'acces#edit'
  post 'acces/edit:id', to: 'acces#edit'

  get 'acces/new'
  
  get 'users/index'

  get 'users/new'

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  
  get '/logout' => 'sessions#destroy'
  
  get 'signup' => 'users#new'
  
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'static_pages#home'
  match '/home', to: 'static_pages#home', via: [:get, :post]
  match '/help', to: 'static_pages#help', via: [:get, :post]  

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
	resources :acces
	resources :actualites
	resources :articles
	resources :entites
	resources :pages
	resources :users

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
