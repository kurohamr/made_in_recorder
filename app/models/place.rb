class Place < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  has_one :address, as: :addressable
end
