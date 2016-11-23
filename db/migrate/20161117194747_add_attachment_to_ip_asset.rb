class AddAttachmentToIpAsset < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_assets, :attachment, :string
  end
end
