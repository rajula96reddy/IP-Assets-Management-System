class AddOrignalIdToOwnerships < ActiveRecord::Migration[5.0]
  def change
    add_column :ownerships, :original_id, :integer
  end
end
