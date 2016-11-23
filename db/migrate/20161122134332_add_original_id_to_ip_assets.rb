class AddOriginalIdToIpAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_assets, :Original_id, :integer
  end
end
