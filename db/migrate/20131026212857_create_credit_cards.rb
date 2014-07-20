class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.integer :user_id
      t.integer :address_id
      t.string :first_name
      t.string :last_name
      t.string :number
      t.integer :expiration_month
      t.integer :expiration_year
      t.integer :ccv

      t.timestamps
    end
  end
end
