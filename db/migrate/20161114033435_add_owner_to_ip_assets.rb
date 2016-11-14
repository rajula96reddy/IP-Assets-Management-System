class AddOwnerToIpAssets < ActiveRecord::Migration[5.0]
  def change
    add_reference :ip_assets, :owner, foreign_key: true
  end
end
