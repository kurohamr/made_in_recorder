class Post < ApplicationRecord
  has_one :thing
  has_one :place
  #belongs_to :user
end
