class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title

      t.timestamps
    end
  end
end
