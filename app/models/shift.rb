class Shift < ApplicationRecord
  belongs_to :line
  belongs_to :user
  has_many :exchange_owners, class_name: "Exchange", foreign_key: :shift_answer_id
  has_many :exchange_answers, class_name: "Exchange", foreign_key: :shift_owner_id
  validates :date, :line_id, :hour_start, :hour_end, :working_hours, :working_minutes, :user_id, presence: :true
  validates :date, uniqueness: { scope: :user_id, message: "Un seul shift par jour !" }

  scope :pending, -> { where('shifts.id NOT IN (SELECT DISTINCT(shift_owner_id) FROM exchanges WHERE exchanges.accepted_owner = ?)', true) }
 end
