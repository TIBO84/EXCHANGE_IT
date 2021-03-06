class SupervisesController < ApplicationController
  before_action :authenticate_user!

  def home
    @exchanges = Exchange.joins(joins_sql).where(where_sql_home, user_unit_id: current_user.unit_id).order(date: :asc)
  end

  def stat
    @exchanges = Exchange.joins(joins_sql).where(where_sql_stat, user_unit_id: current_user.unit_id).order(date: :desc)
    @lines = Unit.find(current_user.unit_id).lines
    if params[:date].present?
      @exchanges = @exchanges.select do |exchange|
        Shift.find(exchange.shift_owner_id).date.to_s == params[:date]
      end
    end

    if params[:line_id].present?
      @exchanges = @exchanges.select do |exchange|
        Shift.find(exchange.shift_owner_id).line_id == params[:line_id].to_i
      end
      # @exchanges = Exchange.where(line_id: params[:line_id])
    end

    if (params[:date].present? && params[:line_id].present?)
      @exchanges = @exchanges.select do |exchange|
        Shift.find(exchange.shift_owner_id).line_id == params[:line_id].to_i && Shift.find(exchange.shift_owner_id).date.to_s == params[:date]
      end
    end
  end


  private

  def joins_sql
    <<~SQL
      INNER JOIN shifts ON shifts.id = exchanges.shift_owner_id
      INNER JOIN users ON users.id = shifts.user_id
      INNER JOIN units ON units.id = users.unit_id
    SQL
  end

  def where_sql_home
    <<~SQL
      units.id = :user_unit_id AND
      accepted_owner IS TRUE AND
      accepted_manager IS NULL
    SQL
  end

  def where_sql_stat
    <<~SQL
      units.id = :user_unit_id AND
      accepted_owner IS TRUE AND
      accepted_manager IS NOT NULL
    SQL
  end
end
