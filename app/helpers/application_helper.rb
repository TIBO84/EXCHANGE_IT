module ApplicationHelper
  def working_hours_to_s(shift)
    shift_seconds_result = (@shift.working_hours.to_i.seconds + @shift.working_minutes.to_i.seconds)
  end

  def working_hours_to_h(shift)
    hours = @shift.working_hours.to_i.seconds / (60 * 60)
    minutes = (@shift.working_minutes.to_i.seconds / 60) % 60
    "#{ hours } h #{ minutes } m"
  end

end
