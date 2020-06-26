class Line < ApplicationRecord
  belongs_to :unit
  has_many :shifts
  validates :name, :transport_type, presence: :true
  validates :name, uniqueness: :true
  TRANSPORT_TYPE = ["Bus", "Métro", "Trolley", "Tramway", "Funiculaire"]
  validates :transport_type, inclusion: { in: TRANSPORT_TYPE }
  LINE_NAMES = ["T1", "T2", "T5", "T6"] # TODO
  validates :name, inclusion: { in: LINE_NAMES }
end
