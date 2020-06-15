class Exchange < ApplicationRecord
  belongs_to :shift_owner, class_name: "Shift", foreign_key: :id
  belongs_to :shift_answer, class_name: "Shift", foreign_key: :id
  validates :shift_owner_id, :shift_answer, presence: :true
  validates :shift_owner_id, uniqueness: { scope: :shift_answer_id, message: “Erreur” }
end
