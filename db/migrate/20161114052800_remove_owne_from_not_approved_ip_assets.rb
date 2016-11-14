class RemoveOwneFromNotApprovedIpAssets < ActiveRecord::Migration[5.0]
  def change
    remove_reference :not_approved_ip_assets, :owner, foreign_key: true
  end
end
