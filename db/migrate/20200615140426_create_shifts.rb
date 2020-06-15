class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.date :date
      t.references :line, null: false, foreign_key: true
      t.time :hour_start
      t.time :hour_end
      t.time :working_hours
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
