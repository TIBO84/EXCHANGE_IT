class Shift < ApplicationRecord
  belongs_to :line
  belongs_to :user
  has_many :exchange_owner, class_name: "Exchange", foreign_key: :shift_owner_id
  has_many :exchange_answer, class_name: "Exchange", foreign_key: :shift_answer_id
end
