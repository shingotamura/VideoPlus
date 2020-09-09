class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    validates :genre, presence: true
    validates :camera, presence: true
    validates :introduce, length: { maximum: 100}
    has_secure_password               
    
    mount_uploader :img, ImgUploader
    mount_uploader :picture, PictureUploader
    
    has_many :relationship_of_follows
    has_many :followings, through: :relationship_of_follows, source: :follow
    has_many :reverses_of_relationship_of_follows, class_name: 'RelationshipOfFollow', foreign_key: 'follow_id'
    has_many :followers, through: :reverses_of_relationship_of_follows, source: :user
    has_many :videoposts
    
    def follow(other_user)
        unless self == other_user
            self.relationship_of_follows.find_or_create_by(follow_id: other_user.id)
        end
    end
    
    def unfollow(other_user)
        relationship_of_follow = self.relationship_of_follows.find_by(follow_id: other_user.id)
        relationship_of_follow.destroy if relationship_of_follow
    end
    
    def following?(other_user)
        self.followings.include?(other_user)
    end

end
