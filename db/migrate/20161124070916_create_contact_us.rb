class CreateContactUs < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_us do |t|
      t.string :name
      t.string :contact_number
      t.string :contact_email_id
      t.string :Tell_us_more_about_you

      t.timestamps
    end
  end
end
