class CreateVideoposts < ActiveRecord::Migration[5.2]
  def change
    create_table :videoposts do |t|
      t.string :youtube_url
      t.string :youtube_title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
