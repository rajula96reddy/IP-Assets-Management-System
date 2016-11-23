class AddIsLicensedToIpAsset < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_assets, :Is_licensed, :boolean
  end
end
