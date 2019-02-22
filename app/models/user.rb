class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #, :confirmable

  # has_one :address, as: :addressable, dependent: :destroy
  has_one :asset, as: :assetable, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :name, presence: true, length: { in: 1..20 }
  validates :introduction, length: { maximum: 200 }
  validates :place, presence: true, length: { maximum: 50 }, on: :update
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { in: 6..30 }

  geocoded_by :place
  after_validation :geocode

end
