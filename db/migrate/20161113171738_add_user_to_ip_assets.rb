class AddUserToIpAssets < ActiveRecord::Migration[5.0]
  def change
    add_reference :ip_assets, :user, foreign_key: true
  end
end
