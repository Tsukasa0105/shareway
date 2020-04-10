class Hobby < ApplicationRecord
    has_many :ways
    has_many :favorite_hobbies
    
    validates :name, presence: true

  def favorite_hobbies_counts(hobby)
    FavoriteHobby.where(hobby_id: hobby.id).count
  end
end