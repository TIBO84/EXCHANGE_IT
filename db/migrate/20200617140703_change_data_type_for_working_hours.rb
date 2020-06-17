class ChangeDataTypeForWorkingHours < ActiveRecord::Migration[6.0]
  def change
    #NOT GOOOD !
    change_column :shifts, :working_hours, :integer
    change_column :shifts, :working_hours, 'integer USING working_hours::integer'
    'ALTER TABLE shifts ALTER working_hours TYPE int2 USING EXTRACT(EPOCH FROM duration)::int2'
  end
end
