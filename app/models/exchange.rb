class Exchange < ApplicationRecord
  belongs_to :shift_owner, class_name: "Shift"
  belongs_to :shift_answer, class_name: "Shift"
  validates :shift_owner, uniqueness: { scope: :shift_answer, message: "Erreur" }
  validate :shift_should_not_be_accepted, if: :accepting?

  def shift_should_not_be_accepted
    if shift_owner.exchange_accepted_level_one?
      errors.add(:accepted_owner, 'Vous ne pouvez accepter un exchange')
    end
  end

  def accepting?
    accepted_owner_change == [nil, true]
  end
end
