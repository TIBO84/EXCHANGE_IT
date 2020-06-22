class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shift, only: [:update, :destroy]

  def new
    @shift = Shift.new
    @lines = Line.all
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.user_id = current_user.id
    if @shift.save
      redirect_to my_answers_path, notice: 'Shift successfully created.'
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
    @shift_answered = Shift.find(params[:shift_id])
    @lines = Line.all
  end

  private

  def shift_params
    params.require(:shift).permit(:date, :hour_start, :hour_end, :line_id, :working_hours, :working_minutes)
  end

  def set_shift
    @shift = Shift.find(params[:id])
  end
end
