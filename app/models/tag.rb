class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :relation_posts, through: :post_tags, source: :post
end
