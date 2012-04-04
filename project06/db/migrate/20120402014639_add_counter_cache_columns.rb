class AddCounterCacheColumns < ActiveRecord::Migration
  def up
		add_column :users, :games_count, :integer, :default => 0
		User.reset_column_information
		User.find(:all).each do |u|
			User.update_counters u.id, :games_count => u.games.length
		end
		
		
		add_column :roles, :users_count, :integer, :default => 0
		Role.reset_column_information
		Role.find(:all).each do |r|
			Role.update_counters r.id, :users_count => r.users.length
		end
  end

  def down
		remove_column :users, :games_count
		remove_column :roles, :users_count
  end
end
