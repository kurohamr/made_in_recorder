class Post < ApplicationRecord
  has_one :thing, dependent: :destroy
  has_one :place, dependent: :destroy
  accepts_nested_attributes_for :thing, allow_destroy: true
  accepts_nested_attributes_for :place, allow_destroy: true
  belongs_to :user
  # has_many :post_tags, dependent: :destroy
  # has_many :relation_tags, through: :post_labels, source: :label
  has_and_belongs_to_many :tags

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
