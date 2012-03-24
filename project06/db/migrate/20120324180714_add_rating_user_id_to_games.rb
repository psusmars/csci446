class AddRatingUserIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :rating, :string
    add_column :games, :user_id, :integer
  end
end
