class Way < ApplicationRecord
  belongs_to :user
  belongs_to :hobby
  
  has_many :favorite_ways, dependent: :destroy
  has_many :enjoyed_ways, dependent: :destroy
  has_many :comments
  
  validates :content, presence: true, length: { maximum: 4000 }
  validates :name, presence: true, length: { maximum: 40 }
  validates :rate, presence: true, inclusion: { in: 0..3 }
  
  
  mount_uploader :image, ImageUploader
  
  def favorite_ways_counts(way)
    FavoriteWay.where(way_id: way.id).count
  end
end
