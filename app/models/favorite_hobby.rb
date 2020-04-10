class FavoriteHobby < ApplicationRecord
  belongs_to :user
  belongs_to :hobby
end
