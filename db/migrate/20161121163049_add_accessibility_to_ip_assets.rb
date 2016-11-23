class AddAccessibilityToIpAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_assets, :accessibility, :string
  end
end
