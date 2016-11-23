class AddStatusToIpAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_assets, :status, :string
  end
end
