class AddAppovalIdToIpAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_assets, :Approval_id, :integer
  end
end
