class AddIndividualRoyaltyToOwnership < ActiveRecord::Migration[5.0]
  def change
    add_column :ownerships, :individual_royalty, :decimal
  end
end
