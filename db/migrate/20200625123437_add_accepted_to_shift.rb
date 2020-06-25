class AddAcceptedToShift < ActiveRecord::Migration[6.0]
  def change
    add_column :shifts, :exchange_accepted_level_one, :boolean
  end
end
