class RemoveUsernamePasswordFromUserSessions < ActiveRecord::Migration
  def up
		remove_column :user_sessions, :username, :password
  end

  def down
		add_column :user_sessions, :username, :password
  end
end
