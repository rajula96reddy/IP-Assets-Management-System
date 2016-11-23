class AddTotalRoyaltyToIpAsset < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_assets, :Total_royalty, :decimal
  end
end
