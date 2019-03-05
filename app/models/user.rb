require 'open-uri'

class User < ApplicationRecord
  attr_accessor :current_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :asset, as: :assetable, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :favorites
  has_many :favarite_posts, through: :favorites, source: :post

  before_validation do
    self.build_asset() if self.asset.nil?
    self.asset.image =  get_image_request("noimage.png") if self.asset.image.nil? || self.asset.image.url.nil?
  end

  validates :name, presence: true, length: { in: 1..20 }
  validates :introduction, length: { maximum: 200 }
  validates :place, presence: true, length: { maximum: 50 }, on: :update
  validates :latitude, presence: true
  validates :longitude, presence: true

  geocoded_by :place
  after_validation :geocode

  def get_image_request(image_name)
      begin
        return open(Rails.env == 'production' ? "evening-meadow-31702.herokuapp.com/assets/#{image_name}" : "http://localhost:3000/assets/#{image_name}")
      rescue => e
        return open("https://raw.githubusercontent.com/legopo/made_in_recorder/master/app/assets/images/noimage.png")
      end
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def like(post)
    favorites.find_or_create_by(post_id: post.id)
  end

  def unlike(post)
    favorite = favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
end
