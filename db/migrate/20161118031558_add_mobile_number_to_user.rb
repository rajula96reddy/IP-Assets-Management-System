class AddMobileNumberToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mobile_number, :integer
  end
end
