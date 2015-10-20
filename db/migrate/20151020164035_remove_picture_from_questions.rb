class RemovePictureFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :picture
  end
end
