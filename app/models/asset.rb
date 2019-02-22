class Asset < ApplicationRecord
  belongs_to :assetable, polymorphic: true, optional: true

  mount_uploader :image, ImageUploader
  # before_create :set_default_image
  # before_update :set_default_image
  #
  # private
  # def set_default_image
  #   self.image =  Pathname.new("#{Rails.public_path}/noimage.jpg").open if self.image.nil?
  #   binding.pry
  # end
end
