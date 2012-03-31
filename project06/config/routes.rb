Gamez::Application.routes.draw do
  resources :games

  resources :roles

  resources :user_sessions

  resources :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
	controller :user_sessions do
		get 'login' => :new
		post 'login' => :create
		post 'logout' => :destroy
	end
	
  root :to => 'games#index'

		
	namespace "admin" do 
		resources :roles
		resources :users
		root controller: 'admin', action: 'index'
	end
	
	namespace "members" do 
		root controller: 'members', action: 'index'
	end
	
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
