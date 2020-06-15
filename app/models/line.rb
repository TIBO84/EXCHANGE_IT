class Line < ApplicationRecord
  belongs_to :unit
  has_many :shifts
  validates :unit_id, :name, :type, :matricule, presence: :true
  validates :name, :matricule, :uniqueness: :true
  TRANSPORT_TYPE = ["Bus", "Métro", "Trolley", "Tramway", "Funiculaire"]
  validates :type, inclusion: { in: TRANSPORT_TYPE }
  LINE_NAMES = ["T1", "T2", "T3", "T4" ] # TODO
  validates :name, inclusion: { in: LINE_NAMES }
end
