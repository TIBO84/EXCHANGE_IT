class Exchange < ApplicationRecord
  belongs_to :shift_owner
  belongs_to :shift_answer
end
