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
    
    if (params[:commit] == "Ajouter une autre proposition")
      if @shift.save
        @exchange = Exchange.new(shift_answer_id: @shift.id, shift_owner_id: params[:shift_owner_id])
        if @exchange.save
          redirect_to shift_new_path, notice: 'Proposition bien enregistrée'
        else
          redirect_to dashboard_path, notice: 'Proposition non valide'
        end
      else
        @shift_answered = Shift.find(params[:shift_owner_id])
        render :new, notice: 'Shift could not be created'
      end

    else
      if @shift.save
        @exchange = Exchange.new(shift_answer_id: @shift.id, shift_owner_id: params[:shift_owner_id])
        if @exchange.save
          redirect_to my_answers_path, notice: 'Proposition bien enregistrée'
        else
          redirect_to dashboard_path, notice: 'Proposition non valide'
        end
      else
        @shift_answered = Shift.find(params[:shift_owner_id])
        render :new, notice: 'Shift could not be created'
      end
    end
  end

  def update
    @exchange = Exchange.find(params[:id])
    if @exchange.update(exchange_params)
      redirect_to supervise_path, notice: 'Answer sent to the user.'
    else
      render :edit
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
    params.require(:exchange).permit(:id, :shift_owner_id, :shift_answer_id, :accepted_owner, :accepted_manager, :message)
  end
end
