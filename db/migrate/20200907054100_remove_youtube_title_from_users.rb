class RemoveYoutubeTitleFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :youtube_title, :string
  end
end
