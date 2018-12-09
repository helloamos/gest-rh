Rails.application.routes.draw do
  

 
  resources :demissions do   
    get 'delete'
  end
  resources :fonctions do     
    get 'delete'
  end
  resources :services
  resources :type_sanctions do
    get 'delete'

  end
  resources :sanctions
  resources :mutations
  #resources :avancements
  resources :type_conges
  resources :conges
  #resources :employes

  resources :employes do
    get 'delete'
  end

  resources :conges do
    get 'delete'
  end

  resources :avancements do
    get 'delete'
  end

  resources :mutations do
    get 'delete'
  end

  resources :services do
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


  delete "/conge/destroy/:id" => "conges#destroy", as: :destroy_conge
  get "/conge/delete/:id" => "conges#delete", as: :delete_conge

  delete "/fonction/destroy/:id" => "fonctions#destroy", as: :destroy_fonction
  get "/fonction/delete/:id" => "fonctions#delete", as: :delete_fonction

  delete "/employe/destroy/:id" => "employes#destroy", as: :destroy_employe
  get "/employe/delete/:id" => "employes#delete", as: :delete_employe

  delete "/avancement/destroy/:id" => "avancements#destroy", as: :destroy_avancement
  get "/avancement/delete/:id" => "avancements#delete", as: :delete_avancement

  delete "/mutation/destroy/:id" => "mutations#destroy", as: :destroy_mutation
  get "/mutation/delete/:id" => "mutations#delete", as: :delete_mutation

  delete "/sanction/destroy/:id" => "sanctions#destroy", as: :destroy_sanction
  get "/sanction/delete/:id" => "sanctions#delete", as: :delete_sanction

  delete "/type-conge/destroy/:id" => "type_conges#destroy", as: :destroy_type_conge
  get "/type-conge/delete/:id" => "type_conges#delete", as: :delete_type_conge

  delete "/service/destroy/:id" => "services#destroy", as: :destroy_service
  get "/service/delete/:id" => "services#delete", as: :delete_service

  delete "/demission/destroy/:id" => "demissions#destroy", as: :destroy_demission
  get "/demission/delete/:id" => "demissions#delete", as: :delete_demission


  delete "/type-sanction/destroy/:id" => "type_sanctions#destroy", as: :destroy_type_sanction
  get "/type-sanction/delete/:id" => "type_sanctions#delete", as: :delete_type_sanction
  
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
