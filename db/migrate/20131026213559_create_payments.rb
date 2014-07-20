class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :sale_id
      t.string :payment_type
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
