class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :country, length: { maximum: 50 }
  validates :state, length: { maximum: 50 }
  validates :city, length: { maximum: 50 }
  validates :address1, length: { maximum: 100 }
  validates :address2, length: { maximum: 100 }
  validates :address3, length: { maximum: 100 }
  validates :postcode, length: { maximum: 20 }
  # validates :latitude,
  # validates :longitude,
end
