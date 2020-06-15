class Exchange < ApplicationRecord
  belongs_to :shift_owner, class_name: "Shift", foreign_key: :id
  belongs_to :shift_answer, class_name: "Shift", foreign_key: :id
end
