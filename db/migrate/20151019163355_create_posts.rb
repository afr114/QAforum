class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.string :picture
      t.datetime :created_at
      t.datetime :edited_at
    end
  end
end
