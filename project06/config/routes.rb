Gamez::Application.routes.draw do
  resources :games
  resources :user_sessions
  resources :users
	
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
	match "/members/me" => "members/users#edit", :as => :me
end
