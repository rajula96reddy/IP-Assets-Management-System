class RemoveUserFromIpAsset < ActiveRecord::Migration[5.0]
  def change
    remove_reference :ip_assets, :user, foreign_key: true
  end
end
