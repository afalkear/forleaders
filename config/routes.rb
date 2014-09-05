Forleaders::Application.routes.draw do
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  localized do
    # resources for users
    devise_for :users
    devise_scope :user do
      get '/login' => 'devise/sessions#new'
      get '/logout' => 'devise/sessions#destroy'
    end
    resources :user, :controller => "user"
    get 'user_root' => 'users#show', as: :user_root
    
    # devise_for :admins
    #scope "/admin" do
    #  get 'admin_root' => 'admins#index', as: :admin_root
    #  resources :users
    #  resources :admins
    #end
      root 'static_pages#home'
      
      # resources users
      post 'edit_users', to: 'users#update'

      #resources :static_pages
      get 'individual_consultory', to:'static_pages#individual_consultory'
      get 'group_consultory', to:'static_pages#group_consultory'
      get 'the_method', to:'static_pages#the_method'
      get 'our_consultors', to: 'static_pages#our_consultors'
      get 'derose_method', to: 'static_pages#derose_method'
      get 'apply', to: 'static_pages#apply'
      get 'contact', to: 'static_pages#contact'
      get 'net', to: 'static_pages#net'
      get 'enterprise_testimonials', to: 'static_pages#enterprise_testimonials'
      get 'institution_testimonials', to: 'static_pages#institution_testimonials'
      resources :articles
  end

  match 'apply_message' => 'static_pages#apply_message', :via => :post
  match 'contact_message' => 'static_pages#contact_message', :via => :post
  mount TranslationCenter::Engine => "/translation_center"

  resources :categories

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
