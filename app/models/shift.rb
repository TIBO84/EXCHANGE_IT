class Shift < ApplicationRecord
  attr_accessor :working_minutes
  belongs_to :line
  belongs_to :user
  has_many :exchange_owners, class_name: "Exchange", foreign_key: :shift_owner_id
  has_many :exchange_answers, class_name: "Exchange", foreign_key: :shift_answer_id
  validates :date, :line_id, :hour_start, :hour_end, :working_hours, :user_id, presence: :true
  validates :date, uniqueness: { scope: :user_id, message: "Un seul shift par jour !" }
end
