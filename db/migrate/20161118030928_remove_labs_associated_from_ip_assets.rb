class RemoveLabsAssociatedFromIpAssets < ActiveRecord::Migration[5.0]
  def change
    remove_column :ip_assets, :Labs_Associated, :integer
  end
end
