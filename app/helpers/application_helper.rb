module ApplicationHelper
  def working_hours_to_s(shift)
    shift_seconds_result = (@shift.working_hours.to_i.seconds + @shift.working_minutes.to_i.seconds)
  end

  def working_hours_to_h(shift)
    shift_hours = @shift.working_hours.to_i.hours
    shift_minutes = @shift.working_minutes.to_i.minutes
  end
end
