class AddUserIdToUserSessions < ActiveRecord::Migration
  def change
    add_column :user_sessions, :user_id, :integer
  end
end
