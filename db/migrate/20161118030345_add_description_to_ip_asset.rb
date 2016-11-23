class AddDescriptionToIpAsset < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_assets, :Description, :text
  end
end
