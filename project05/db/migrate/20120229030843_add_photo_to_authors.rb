class AddPhotoToAuthors < ActiveRecord::Migration
  def self.up
    change_table :authors do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :authors, :photo
  end
end
