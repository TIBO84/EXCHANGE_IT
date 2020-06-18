class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shift, only: [:update, :destroy]
  
  def new
    @shift = Shift.new
    @lines = Line.all
  end

  def create
    @shift = Shift.new(shift_params)

    #@shift.working_hours = transform(working_params)

    @shift.user_id = current_user.id
    if @shift.save
      #stocker en secondes ??
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
    @shift_answered = Shift.find(params[:shift_id])
  end

  private

  def transform(working_params)
    return (working_params[:working_hours].to_i.hours + working_params[:working_minutes].to_i.minutes).seconds
    #minutes = w_minutes.secondes
    #result = hours + minutes
    #shift_params.map do |k, v|
    #  if k == working_hours
    #  working_hours == result
    #  end
    #end

  end

  def shift_params
    params.require(:shift).permit(:date, :hour_start, :hour_end, :line_id, :working_hours, :working_minutes)
  end

  #def working_params
    #params.require(:shift).permit(:working_hours, :working_minutes)
  #end

  def set_shift
    @shift = Shift.find(params[:id])
  end
end
