authorization do
  role :admin do
		includes :member
		has_permission_on :admin_games, :to => :manage
    has_permission_on :admin_users, :to => :manage
		has_permission_on :admin_roles, :to => :manage
		has_permission_on :admin_admin, :to => :read
  end
  
  role :guest do
		has_permission_on :games, :to => [:index]
		has_permission_on :users, :to => [:create]
  end
  
  role :member do
		includes :guest
		has_permission_on :members_members, :to => :read
		has_permission_on :members_users, :to => [:edit, :update] do
			if_attribute :id => is { user.id }
    end
		has_permission_on :members_games, :to => [:new, :create]
		has_permission_on :members_games, :to => [:edit, :update] do
			if_attribute :user_id => is { user.id }
		end
  end
end

privileges do
	privilege :manage, :includes => [:create, :read, :update, :delete]
	privilege :read, :includes => [:index, :show]
	privilege :create, :includes => :new
	privilege :update, :includes => :edit
	privilege :delete, :includes => :destroy
end