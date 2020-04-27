class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :way, optional: true
end
