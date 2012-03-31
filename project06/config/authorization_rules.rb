authorization do
  role :admin do
    #has_permission_on :admin_users, :to => :manage
		#has_permission_on :admin_roles, :to => :manage
  end
  
  role :guest do
   # has_permission_on :articles, :to => [:index, :show]
   # has_permission_on :comments, :to => [:new, :create]
   # has_permission_on :comments, :to => [:edit, :update] do
   #   if_attribute :user => is { user }
   # end
  end
  
  role :member do
   # includes :guest
   # has_permission_on :comments, :to => [:edit, :update]
  end
end