class Way < ApplicationRecord
  belongs_to :user
  belongs_to :hobby
  
  has_many :favorite_ways, dependent: :destroy
  has_many :comments
  
  validates :content, presence: true, length: { maximum: 4000 }
  validates :name, presence: true, length: { maximum: 40 }
  
  mount_uploader :image, ImageUploader
  
  def favorite_ways_counts(way)
    FavoriteWay.where(way_id: way.id).count
  end
  
  def self.search(search)
    if search
      Way.where(['content LIKE ?', "%#{search}%"])
    else
      Way.all
    end
  end 
end
