class AddIsFundedByCollegeToIpAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_assets, :Is_funded_by_colege, :boolean
  end
end
