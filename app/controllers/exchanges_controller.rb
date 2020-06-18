class ExchangesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @shift = Shift.new(shift_params)
    @shift.user_id = current_user.id
    if @shift.save
      @exchange = Exchange.new(shift_owner_id: @shift.id)
      redirect_to dashboard_path, notice: 'Shift successfully created.'
    else
      render :new
    end
  end

  def accept_user!
    @exchange = Exchange.find(params[:exchange_id])
    @exchanges_refused = Exchange.joins(joins_sql_myexchanges).where(where_sql_myexchanges_refused, user_id: current_user.id)
    @exchange.update(accepted_owner:true)

    @exchanges_refused.update(accepted_owner:false)
    redirect_to my_shifts_path, notice: 'Echange validé'
  end

  def accept_manager!
    @exchange = Exchange.find(params[:exchange_id])
    @exchange.update(accepted_manager:true)
    redirect_to supervise_path, notice: 'Echange validé'
  end

  private

  def shift_params
    # TODO
  end

  def exchange_params
    params.require(:exchange).permit(:exchange_id, :shift_owner_id, :shift_answer_id, :accepted_owner, :accepted_manager)
  end
end
