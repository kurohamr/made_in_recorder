class Post < ApplicationRecord
  has_one :thing, dependent: :destroy
  has_one :place, dependent: :destroy
  accepts_nested_attributes_for :thing, allow_destroy: true
  accepts_nested_attributes_for :place, allow_destroy: true
  #belongs_to :user
end
