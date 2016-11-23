class AddLabsAssociatedToIpAsset < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_assets, :Labs_Associated, :string
  end
end
