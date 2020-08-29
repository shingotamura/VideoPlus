class RemovePictureFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :picture, :text
  end
end
