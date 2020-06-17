class Exchange < ApplicationRecord
  belongs_to :shift_owner, class_name: "Shift"
  belongs_to :shift_answer, class_name: "Shift"
  validates :shift_owner, uniqueness: { scope: :shift_answer, message: "Erreur" }
end
