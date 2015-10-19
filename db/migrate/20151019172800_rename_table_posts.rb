class RenameTablePosts < ActiveRecord::Migration
  def change
    rename_table :posts, :questions
  end
end
