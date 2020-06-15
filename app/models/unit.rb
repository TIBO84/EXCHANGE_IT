class Unit < ApplicationRecord
  has_many :lines
  has_many :users
end
