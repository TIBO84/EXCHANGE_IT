class RemoveNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column :exchanges, :accepted_owner, :boolean, null: true
    change_column :exchanges, :accepted_manager, :boolean, null: true
  end
end
