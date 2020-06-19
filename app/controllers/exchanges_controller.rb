class ExchangesController < ApplicationController
  before_action :authenticate_user!

  def new
    @shift = Shift.new
    @shift_answered = Shift.find(params[:shift_id])
    @lines = Line.all
  end

  # POST /exchanges
  def create
    @shift = Shift.new(shift_params)
    @shift.user_id = current_user.id
    if @shift.save
      @exchange = Exchange.new(shift_answer_id: @shift.id, shift_owner_id: params[:shift_owner_id])
      if @exchange.save
        redirect_to my_answers_path, notice: 'Shift and Exchange successfully created.'
      else
        redirect_to dashboard_path, notice: 'Exchange could not be created'
      end
    else
      @shift_answered = Shift.find(params[:shift_owner_id])
      render :new, notice: 'Shift could not be created'
    end
  end

  def accept_user!
    @exchange = Exchange.find(params[:exchange_id])
    # @exchanges_refused = Exchange.joins(joins_sql_myexchanges).where(where_sql_myexchanges_refused, user_id: current_user.id)
    @exchange.update(accepted_owner:true)

    # @exchanges_refused.update(accepted_owner:false)
    redirect_to my_shifts_path, notice: 'Echange validé'
  end

  def accept_manager!
    @exchange = Exchange.find(params[:exchange_id])
    @exchange.update(accepted_manager:true)
    @exchange.update(accepted_manager:true)
    redirect_to supervise_path, notice: 'Echange validé'
  end

  def refuse_manager!
    @exchange = Exchange.find(params[:exchange_id])
    @exchange.update(accepted_manager:false)
    redirect_to supervise_path, notice: 'Echange refusé'
  end

  private

  def shift_params
    params.require(:shift).permit(:date, :hour_start, :hour_end, :line_id, :working_hours, :working_minutes)
  end

  def exchange_params
    params.require(:exchange).permit(:exchange_id, :shift_owner_id, :shift_answer_id, :accepted_owner, :accepted_manager)
  end
end
