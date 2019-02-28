class Asset < ApplicationRecord
  belongs_to :assetable, polymorphic: true, optional: true
  mount_uploader :image, ImageUploader
end
