class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :address_type
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :zip
      t.string :state
      t.string :phone

      t.timestamps
    end
  end
end
