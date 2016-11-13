class CreateNotApprovedIpAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :not_approved_ip_assets do |t|
      t.integer :Research_group_ID
      t.string :Type
      t.string :Labs_Associated

      t.timestamps
    end
  end
end
