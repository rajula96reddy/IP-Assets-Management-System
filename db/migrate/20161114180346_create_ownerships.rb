class CreateOwnerships < ActiveRecord::Migration[5.0]
  def change
    create_table :ownerships do |t|
      t.integer :user_id
      t.integer :ip_asset_id

      t.timestamps
    end
  end
end
