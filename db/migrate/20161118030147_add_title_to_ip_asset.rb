class AddTitleToIpAsset < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_assets, :Title, :text
  end
end
