class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  # has_one :address, as: :addressable, dependent: :destroy
  has_one :asset, as: :assetable, dependent: :destroy

  # accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :asset, allow_destroy: true

  validates :place, presence: true, length: { maximum: 50 }
  validates :thing, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :user_id, presence: true

  geocoded_by :place
  after_validation :geocode

  after_create do
    post = Post.find_by(id: self.id)
    tags  = self.description.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |tag|
      tag = Tag.find_or_create_by(name: tag.downcase.delete('#'))
      post.tags << tag
    end
  end

  before_update do
    post = Post.find_by(id: self.id)
    post.tags.clear
    tags = self.description.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |tag|
      tag = Tag.find_or_create_by(name: tag.downcase.delete('#'))
      post.tags << tag
    end
  end
end
