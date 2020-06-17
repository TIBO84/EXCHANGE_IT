class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :clean_shifts, only: [:home]
  before_action :set_current_user, only: [:home, :my_shifts, :my_answers]

  def home
    @shifts = Shift.joins(joins_sql)
                   .where(where_sql, user_id: current_user.id, unit_id: current_user.unit_id, date: Date.today)
                   .order(:date)
  end

  def my_shifts
    @shifts = current_user.shifts.where(shift_owner_id: true)
  end

  def my_answers
    @shifts = current_user.shifts.where(shift_answer_id: true)
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

  def where_sql
    <<~SQL
      users.id != :user_id AND
      users.unit_id = :unit_id AND
      shifts.date > :date AND
      exchanges.id IS NULL
    SQL
  end

  def joins_sql
    <<~SQL
      INNER JOIN users ON users.id = shifts.user_id
      INNER JOIN lines ON lines.id = shifts.line_id
      LEFT JOIN exchanges ON (exchanges.shift_owner_id = shifts.id AND exchanges.accepted_owner IS TRUE) OR exchanges.shift_answer_id = shifts.id
    SQL
  end
end
