class FavoriteWay < ApplicationRecord
  belongs_to :user
  belongs_to :way
end
