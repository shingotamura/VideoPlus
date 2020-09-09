class CreateRelationshipOfFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :relationship_of_follows do |t|
      t.references :user, foreign_key: true
      t.references :follow, foreign_key: { to_table: :users }

      t.timestamps
      
      t.index [:user_id, :follow_id], unique: true
    end
  end
end
