class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :clean_shifts, only: [:home]
  before_action :set_current_user, only: [:home]

  def home
    # TODO // A MODIFIER
    # @shifts = Shift.joins(:exchanges).where(unit_id: current_user.unit_id).where(shift_owner_id: nil || false)
    # unit.id && (no exchanges associated || exchanges associated with 2 bolleans null )
    # ou rajouter boolean dans table Shift "available : yes"
  end

  def my_shifts
  end

  def my_answers
  end

  private

  def clean_shifts
    # @shifts = Shift.joins(:exchanges).where("date < ?", Date.yesterday).where(accepted_manager: false)
    # @shifts.each do |shift|
    #   shift.destroy
    # end
  end

  def set_current_user
    @current_user = current_user
  end
end
