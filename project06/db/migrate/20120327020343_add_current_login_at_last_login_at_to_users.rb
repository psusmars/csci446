class AddCurrentLoginAtLastLoginAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_login_at, :datetime
    add_column :users, :last_login_at, :datetime
  end
end
