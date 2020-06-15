class Unit < ApplicationRecord
  has_many :lines
  has_many :users
  validates :name, uniqueness: :true
  validates :name, presence: :true
end
