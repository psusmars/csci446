class RemoveAuthorFromArticle < ActiveRecord::Migration
  def up
    remove_column :articles, :author
  end

  def down
    add_column :articles, :author, :string
  end
end
