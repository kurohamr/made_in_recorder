class Asset < ApplicationRecord
  belongs_to :assetable, polymorphic: true
end
