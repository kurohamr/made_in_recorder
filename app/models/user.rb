class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :address, as: :addressable, dependent: :destroy
  has_one :asset, as: :assetable, dependent: :destroy
  has_many :posts, dependent: :destroy
end
