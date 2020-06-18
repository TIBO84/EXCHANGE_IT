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
    @exchange.update(accepted_owner:true)
  end

  def accept_manager!
    @exchange = Exchange.find(params[:exchange_id])
    @exchange.update(accepted_manager:true)
    redirect_to supervise_path
  end

  def refuse_manager!
    @exchange = Exchange.find(params[:exchange_id])
    @exchange.update(accepted_manager:false)
    redirect_to supervise_path
  end

  private

  def shift_params
    # TODO
  end

  def exchange_params
    params.require(:exchange).permit(:exchange_id, :shift_owner_id, :shift_answer_id, :accepted_owner, :accepted_manager)
  end
end
