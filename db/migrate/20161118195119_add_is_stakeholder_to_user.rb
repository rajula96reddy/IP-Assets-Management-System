class AddIsStakeholderToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :Is_stakeholder, :boolean
  end
end
