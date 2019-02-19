class Tag < ApplicationRecord
  # has_many :post_tags, dependent: :destroy
  # has_many :relation_posts, through: :post_tags, source: :post
  validates :name, presence: true, length: {maximum: 50}

  has_and_belongs_to_many :posts
end
