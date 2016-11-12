class CreateIpAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :ip_assets do |t|
      t.integer :Research_group_ID
      t.string :Type
      t.string :Labs_Associated

      t.timestamps
    end
  end
end
