class CreateExchanges < ActiveRecord::Migration[6.0]
  def change
    create_table :exchanges do |t|
      t.references :shift_owner, null: false, foreign_key: {to_table: :shifts}
      t.references :shift_answer, null: false, foreign_key: {to_table: :shifts}
      t.boolean :accepted_owner
      t.boolean :accepted_manager

      t.timestamps
    end
  end
end
