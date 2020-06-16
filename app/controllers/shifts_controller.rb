class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shift, only: [:update, :destroy]
  before_action :shift_new, only: [:answer, :new]

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.user_id = current_user.id
    if @shift.save
      redirect_to dashboard_path, notice: 'Shift successfully created.'
    else
      render :new
    end
  end

  def update
    if @shift.update(shift_params)
      redirect_to dashboard_path, notice: 'Shift was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @shift.destroy
    redirect_to shifts_url, notice: 'Shift was successfully destroyed.'
  end

  def answer
    @shift = Shift.new
    @shift_answered = Shift.find(params[:id])
  end

  private

  def shift_params
    params.require(:shift).permit(:date, :hour_start, :hour_end, :working_hours, :line_id)
  end

  def set_shift
    @shift = Shift.find(params[:id])
  end
end
