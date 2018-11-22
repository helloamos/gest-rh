Rails.application.routes.draw do
  

 
  resources :sanctions
  resources :mutations
  resources :avancements
  resources :type_conges
  resources :conges
  #resources :employes

  resources :employes do
    get 'delete'
  end
    resources :roles
  resources :super_admins
  get "/dashboard" => "dashboard#index" , as: :dashboard

  get '/settings/superadmin' => 'super_admins#new', as: :super_admin_setup


  get "/users"     => "custom_users#index", as: :all_users 
  get "/users/unregistered"     => "custom_users#unregistered", as: :unregistered_commission_percentage 
  
  post "/users/new"     => "custom_users#create", as: :create_user
  get "/users/new"     => "custom_users#new", as: :new_user
  get "/user/edit/:id" => "custom_users#edit", as: :edit_user

  patch "/user/update/:id" => "custom_users#update", as: :udapte_user

 
  
  delete "/user/destroy/:id" => "custom_users#destroy", as: :destroy_user
  get "/user/delete/:id" => "custom_users#delete", as: :delete_user


  delete "/employe/destroy/:id" => "employes#destroy", as: :destroy_employe
  get "/employe/delete/:id" => "employes#delete", as: :delete_employe
  
  get "/user/enable/:id" => "custom_users#get_enable", as: :get_enable_user_account
  post "/user/enable/:id" => "custom_users#post_enable", as: :post_enable_user_account

  get "/user/disable/:id" => "custom_users#get_disable", as: :get_disable_user_account
  post "/user/disable/:id" => "custom_users#post_disable", as: :post_disable_user_account

  get "/user/update/:id" => "custom_users#update", as: :update_user

  get "/settings/mail" => "mail_configurations#settings", as: :mail_settings

  get "/user/show/:id" => "custom_users#show", as: :show_user
  get "/settings/profile" => "profiles#settings", as: :profile_settings
  
    devise_for :users, path: '', controllers: { 
            registrations: "users/registrations",
            confirmations: 'users/confirmations',
            passwords: "users/passwords",
            sessions: "users/sessions"
            
        }, 
        path_names: {
            sign_in: 'login', 
            sign_out: 'logout', 
            password: 'secret', 
            confirmation: 'verification', 
            unlock: 'unblock', 
            registration: 'signup', 
            sign_up: '' 
        }

		
        devise_scope :user do
 		    authenticated :user do
    		    root 'dashboard#index', as: :authenticated_root
  		    end

  		    unauthenticated do
    		    root 'users/sessions#new', as: :unauthenticated_root
  		    end
	    end
	
		%w( 404 422 500 ).each do |code|
			get code, :to => "errors#show", :code => code
		end
	


end
