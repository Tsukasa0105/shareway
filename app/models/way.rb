class Way < ApplicationRecord
  belongs_to :user
  belongs_to :hobby
  
  has_many :favorite_ways, dependent: :destroy
  has_one_attached :avatar
  
  validates :content, presence: true
  validates :name, presence: true
  
  mount_uploader :image, ImageUploader
  
  def favorite_ways_counts(way)
    FavoriteWay.where(way_id: way.id).count
  end
  
end
