class RemoveIpAssetIdFromOwnerships < ActiveRecord::Migration[5.0]
  def change
    remove_column :ownerships, :ip_asset_id, :integer
  end
end
