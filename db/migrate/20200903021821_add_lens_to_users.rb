class AddLensToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lens, :string
  end
end
