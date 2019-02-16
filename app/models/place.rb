class Place < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  has_one :address, as: :addressable

  validates :name, presence: true, length: { in: 1..50 }
end
