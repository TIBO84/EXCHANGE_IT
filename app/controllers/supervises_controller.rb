class SupervisesController < ApplicationController
  before_action :authenticate_user!

  def home
    @exchanges = Exchange.joins(joins_sql).where(where_sql_home, user_unit_id: current_user.unit_id).order(date: :asc)
  end

  def stat
    @exchanges = Exchange.joins(joins_sql).where(where_sql_stat, user_unit_id: current_user.unit_id).order(date: :desc)
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
