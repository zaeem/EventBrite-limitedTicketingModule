class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :bid_id
      t.integer :offer_id
      t.integer :ticket_status_id
      t.integer :quantity
      t.decimal :price,  :precision => 8, :scale => 2
      t.integer :affiliate_id
      t.string :payment_status
      t.integer :coupon_code_id

      t.timestamps
    end
  end
end
