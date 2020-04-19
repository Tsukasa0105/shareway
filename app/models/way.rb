class Way < ApplicationRecord
  belongs_to :user
  belongs_to :hobby
  
  has_many :favorite_ways, dependent: :destroy
  
  validates :content, presence: true, length: { maximum: 4000 }
  validates :name, presence: true, length: { minimum: 40 }
  
  mount_uploader :image, ImageUploader
  
  def favorite_ways_counts(way)
    FavoriteWay.where(way_id: way.id).count
  end
  
end
