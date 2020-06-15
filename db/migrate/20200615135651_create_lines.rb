class CreateLines < ActiveRecord::Migration[6.0]
  def change
    create_table :lines do |t|
      t.string :name
      t.string :type
      t.string :matricule
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
