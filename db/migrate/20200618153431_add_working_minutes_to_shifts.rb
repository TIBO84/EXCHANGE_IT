class AddWorkingMinutesToShifts < ActiveRecord::Migration[6.0]
  def change
    add_column :shifts, :working_minutes, :integer
  end
end
