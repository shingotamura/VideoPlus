class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :title
      t.string :password_digest
      t.text :introduce
      t.string :phonenumber
      t.text :picture
      t.string :genre

      t.timestamps
    end
  end
end
