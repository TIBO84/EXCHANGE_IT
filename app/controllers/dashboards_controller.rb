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
    @exchanges_pending_manager = Exchange.joins(joins_sql_myshifts).where(where_sql_myshifts_pending, user_id: current_user.id)
    @exchanges_validated = Exchange.joins(joins_sql_myshifts).where(where_sql_myshifts_validated, user_id: current_user.id)
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
  # METHODS FOR HOME
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

  # METHODS FOR MY_SHIFTS
  def where_sql_myshifts_pending
    <<~SQL
      users.id = :user_id AND
      accepted_owner IS TRUE AND
      accepted_manager IS NULL
    SQL
  end

  def joins_sql_myshifts
    <<~SQL
      INNER JOIN shifts ON shifts.id = exchanges.shift_owner_id
      INNER JOIN users ON users.id = shifts.user_id
    SQL
  end

  def where_sql_myshifts_validated
    <<~SQL
      users.id = :user_id AND
      accepted_owner IS TRUE AND
      accepted_manager IS TRUE
    SQL
  end
end
