class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :clean_shifts, only: [:home]
  before_action :set_current_user, only: [:home]

  def home
  # Shift.joins().where(sql, user_id: current_user.id).order(:date)

  # SELECT shifts.*
  # from shifts
  # INNER JOIN users ON users.id = shifts.user_id
  # INNER JOIN lines ON lines.id = shifts.line_id
  # LEFT JOIN exchanges ON (exchanges.shift_owner_id = shifts.id AND exchanges.accepted_owner IS TRUE) OR exchanges.shift_answer_id = shifts.id

  # WHERE users.id != :user_id AND
  #   users.unit_id = 7 AND
  #   shifts.date > '2020-06-17' AND
  #     exchanges.id IS NULL
  # ORDER BY shifts.date
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
