# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_and_belongs_to_many :tags
  has_one :asset, as: :assetable, dependent: :destroy
  accepts_nested_attributes_for :asset, allow_destroy: true

  before_save :image_validation
  validates :place, presence: true, length: { maximum: 50 }
  validates :thing, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :user_id, presence: true

  geocoded_by :place
  after_validation :geocode

  after_create do
    post = Post.find_by(id: id)
    tags = description.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |tag|
      tag = Tag.find_or_create_by(name: tag.downcase.delete('#'))
      post.tags << tag
    end
  end

  before_update do
    post = Post.find_by(id: id)
    post.tags.clear
    tags = description.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |tag|
      tag = Tag.find_or_create_by(name: tag.downcase.delete('#'))
      post.tags << tag
    end
  end

  private

  def image_validation
    if asset.image.blank? # TODO/blank? empty? nil?
      errors.add '画像', 'がありません'
      throw :abort
    end
  end
end
