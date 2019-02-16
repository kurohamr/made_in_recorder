class Thing < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  has_one :asset, as: :assetable

validates :name, presence: true, length: { in: 1..50 }
end
