class AddResearchGroupsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :Research_Groups, :integer
  end
end
