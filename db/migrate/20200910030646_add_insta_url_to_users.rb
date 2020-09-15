class AddInstaUrlToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :insta_url, :string
  end
end
