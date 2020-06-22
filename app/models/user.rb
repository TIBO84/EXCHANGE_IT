class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shifts
  has_many :exchange_answers, through: :shifts, source: :exchange_owners
  has_many :shift_answered, -> { distinct }, through: :exchange_answers, source: :shift_owner
  belongs_to :unit
  validates :first_name, :last_name, :unit_id, :email, :matricule, presence: :true
  validates :matricule, uniqueness: :true
  validates :last_name, uniqueness: { scope: :matricule }
end
