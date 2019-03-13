# frozen_string_literal: true

class Tag < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  has_and_belongs_to_many :posts
end
