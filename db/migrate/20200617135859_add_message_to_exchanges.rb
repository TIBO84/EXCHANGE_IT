class AddMessageToExchanges < ActiveRecord::Migration[6.0]
  def change
    add_column :exchanges, :message, :string
  end
end
