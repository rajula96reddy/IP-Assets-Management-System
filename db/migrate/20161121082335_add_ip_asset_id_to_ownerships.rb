class AddIpAssetIdToOwnerships < ActiveRecord::Migration[5.0]
  def change
    add_column :ownerships, :ip_asset_id, :integer
  end
end
