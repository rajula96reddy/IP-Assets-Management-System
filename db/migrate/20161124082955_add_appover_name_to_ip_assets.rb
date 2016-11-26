class AddAppoverNameToIpAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_assets, :Approver_name, :string
  end
end
