class AddAppToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :app, :string
  end
end
