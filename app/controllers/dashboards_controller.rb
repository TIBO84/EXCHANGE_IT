class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :clean_shifts, only: [:home]
  before_action :set_current_user, only: [:home, :my_shifts, :my_answers]

  def home
    @lines = Line.all
    @shifts = Shift.joins(joins_sql)
                   .where(where_sql, user_id: current_user.id, unit_id: current_user.unit_id, date: Date.today)
                   .order(:date)
    if params[:date].present?
      @shifts = Shift.where(date: params[:date])
    end

    if params[:line_id].present?
      @shifts = Shift.where(line_id: params[:line_id])
    end

    if (params[:date].present? && params[:line_id].present?)
      @shifts = Shift.where(date: params[:date]).where(line_id: params[:line_id])
    end
  end

  def my_shifts
    # ECHANGES EN ATTENTE DE VALIDATION MANAGER
    @exchanges_pending_manager = Exchange.joins(joins_sql_myshifts).where(where_sql_myshifts_pending_manager, user_id: current_user.id)

    # SHIFTS EN ATTENTE DE REPONSES OU AVEC REPONSE (SHIFT) A CHOISIR
    @exchanges_pending_users = Exchange.joins(joins_sql_myshifts).where(where_sql_myshifts_pending_users, user_id: current_user.id)
    @shifts_owner_pending_users = Shift.select("shifts.id").joins(joins_sql_myshifts_shifts_owner).where(where_sql_myshifts_shifts_owner, user_id: current_user.id).group("shifts.id").order("shifts.id")

    @shifts_and_answers = {}
    @shifts_owner_pending_users.each do |shift|
      @shifts_and_answers["#{shift.id}"] = []
    end

    @exchanges_pending_users.each do |exchange|
      if @shifts_and_answers.key?("#{exchange.shift_owner_id}")
        @shifts_and_answers["#{exchange.shift_owner_id}"] <<  { exchange.shift_answer_id => exchange.id } # pour integrer instance plutot que id : Shift.find(exchange.shift_answer_id)
      end
    end
    # HISTORIQUE DES ECHANGES ACCEPTES
    @exchanges_validated = Exchange.joins(joins_sql_myshifts).where(where_sql_myshifts_validated, user_id: current_user.id)
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
  def joins_sql_myshifts
    <<~SQL
      INNER JOIN shifts ON shifts.id = exchanges.shift_owner_id
      INNER JOIN users ON users.id = shifts.user_id
    SQL
  end

  def joins_sql_myshifts_shifts_owner
    <<~SQL
      INNER JOIN users ON users.id = shifts.user_id
      LEFT JOIN exchanges ON (exchanges.shift_owner_id = shifts.id AND exchanges.accepted_owner IS NULL) OR exchanges.shift_owner_id = shifts.id
    SQL
  end


  def where_sql_myshifts_pending_manager
    <<~SQL
      users.id = :user_id AND
      accepted_owner IS TRUE AND
      accepted_manager IS NULL
    SQL
  end

  def where_sql_myshifts_validated
    <<~SQL
      users.id = :user_id AND
      accepted_owner IS TRUE AND
      accepted_manager IS TRUE
    SQL
  end

  def where_sql_myshifts_pending_users
    <<~SQL
      users.id = :user_id AND
      accepted_owner IS NULL AND
      accepted_manager IS NULL
    SQL
  end

  def where_sql_myshifts_shifts_owner
    <<~SQL
      users.id = :user_id
    SQL
  end
end
