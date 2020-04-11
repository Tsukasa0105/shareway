class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 },
                     uniqueness: true
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  has_many :ways
  has_many :favorite_hobbies
  has_many :like_hobbies, through: :favorite_hobbies, source: :hobby
  has_many :favorite_ways
  has_many :like_ways, through: :favorite_ways, source: :way
  
  mount_uploader :image, ImageUploader
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def feed_ways
    Way.where(user_id: self.following_ids + [self.id])
  end
  
  def favorite_hobby(hobby)
      favorite_hobbies.find_or_create_by(hobby_id: hobby.id)
  end

  def unfavorite_hobby(hobby)
    favorite_hobby = favorite_hobbies.find_by(hobby_id: hobby.id)
    favorite_hobby.destroy if favorite_hobby
  end

  def favorite_hobby?(hobby)
    self.like_hobbies.include?(hobby)
  end
  
  def favorite_way(way)
      favorite_ways.find_or_create_by(way_id: way.id)
  end

  def unfavorite_way(way)
    favorite_way = favorite_ways.find_by(way_id: way.id)
    favorite_way.destroy if favorite_way
  end

  def favorite_way?(way)
    self.like_ways.include?(way)
  end
end
