class RemoveUserIdFromOwnerships < ActiveRecord::Migration[5.0]
  def change
    remove_column :ownerships, :user_id, :integer
  end
end
