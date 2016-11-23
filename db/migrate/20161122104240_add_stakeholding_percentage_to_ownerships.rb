class AddStakeholdingPercentageToOwnerships < ActiveRecord::Migration[5.0]
  def change
    add_column :ownerships, :stakeholding_percentage, :decimal
  end
end
