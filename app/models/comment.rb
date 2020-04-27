class Comment < ApplicationRecord
  
  
  belongs_to :user
  belongs_to :way
  
  validates :content, presence: true, length: { maximum: 300 }
  
end
