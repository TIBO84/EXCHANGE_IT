class SupervisesController < ApplicationController
  before_action :authenticate_user!

  def home
    @exchanges_pending_manager = Exchange.joins(joins_sql_myshifts).where(where_sql_myshifts_pending_manager, user_id: current_user.id)
    @exchanges_pending_manager = @exchanges_pending_manager.order(id: :asc)
  end

  def stat
  end




  private 

  def joins_sql_myshifts
    <<~SQL
      INNER JOIN shifts ON shifts.id = exchanges.shift_owner_id
      INNER JOIN users ON users.id = shifts.user_id
    SQL
  end

  def where_sql_myshifts_pending_manager
    <<~SQL
      users.id = :user_id AND
      accepted_owner IS TRUE AND
      accepted_manager IS NULL
    SQL
  end

end
