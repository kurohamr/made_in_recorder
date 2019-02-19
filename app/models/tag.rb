class Tag < ApplicationRecord
  has_many :place_tags, dependent: :destroy
  has_many :thing_tags, dependent: :destroy
  has_many :relation_posts, through: :place_tags, source: :post
  has_many :relation_posts, through: :thing_tags, source: :post
end
