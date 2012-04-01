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
		resources :games
		root controller: 'admin', action: 'index'
	end
	
	namespace "members" do 
		resources :users
		resources :games
		root controller: 'members', action: 'index'
	end
	
  # MATCHES
	match "register" => "users#new"
	match "login" => "user_sessions#new"
	match "members/me" => "members/users#edit"
end
