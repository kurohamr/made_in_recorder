class Thing < ApplicationRecord
  belongs_to :post
  has_one :asset, as: :assetable
end
