class Thing < ApplicationRecord
  #TODO: Optional true is for escaping exist validation on assciation.
  belongs_to :post, foreign_key: :post_id, optional: true
  has_one :asset, as: :assetable, dependent: :destroy
  has_many :relation_tags, through: :thing_tags, source: :tag

  accepts_nested_attributes_for :asset, allow_destroy: true

  validates :name, presence: true, length: { in: 1..50 }
end
