class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.decimal :royalty
      t.boolean :Is_stateholder

      t.timestamps
    end
  end
end
