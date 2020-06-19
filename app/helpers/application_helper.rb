module ApplicationHelper
  def working_hours_to_s(shift)
    shift_seconds_result = (@shift.working_hours.to_i.seconds + @shift.working_minutes.to_i.seconds)
  end

  def working_hours_to_h(shift)
    Time.at((shift.working_hours.hour.seconds + shift.working_minutes.hour.seconds)).utc.strftime("%H:%M")
  end
end
