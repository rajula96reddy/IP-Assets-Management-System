class AddOwnerIdToNotApprovedIpAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :not_approved_ip_assets, :owner_id, :integer
  end
end
