class Asset < ApplicationRecord
  #TODO: Optional true is for escaping exist validation on assciation.
  belongs_to :assetable, polymorphic: true, optional: true

  mount_uploader :image, ImageUploader

  # validates :image, presence: true
end
