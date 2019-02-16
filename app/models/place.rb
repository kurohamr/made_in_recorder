class Place < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true
  validates :name, presence: true, length: { in: 1..50 }
end
