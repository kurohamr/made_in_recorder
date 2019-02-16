class Thing < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  has_one :asset, as: :assetable, dependent: :destroy
  accepts_nested_attributes_for :asset, allow_destroy: true
  validates :name, presence: true, length: { in: 1..50 }
end
