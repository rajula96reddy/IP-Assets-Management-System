class AddIsPatentedToIpAsset < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_assets, :Is_patented, :boolean
  end
end
