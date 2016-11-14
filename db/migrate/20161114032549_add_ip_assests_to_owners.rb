class AddIpAssestsToOwners < ActiveRecord::Migration[5.0]
  def change
    add_reference :owners, :ip_assets, foreign_key: true
  end
end
