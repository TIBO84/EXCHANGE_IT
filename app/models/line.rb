class Line < ApplicationRecord
  belongs_to :unit
  has_many :shifts
end
