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
  end

  def accept_manager!
  end

  private

  def shift_params
    # TODO
  end
end
