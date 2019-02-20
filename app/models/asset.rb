class Asset < ApplicationRecord
  #TODO: Optional true is for escaping exist validation on assciation.
  belongs_to :assetable, polymorphic: true, optional: true

  mount_uploader :image, ImageUploader

  #TODO: バリデーションかテーブルでnull falseか検討
  # validates :image, presence: true, if: :post_image?
  #
  # def post_image?
  #   assetable_type == "Post"
  # end
  # validates :assetable_id, presence: true
  # validates :assetable_type, presence: true
end
