class Videopost < ApplicationRecord
  belongs_to :user
  
  validates :youtube_title, presence: true, length: { maximum: 50 }
end
