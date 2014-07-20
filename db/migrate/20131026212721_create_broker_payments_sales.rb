class CreateBrokerPaymentsSales < ActiveRecord::Migration
  def change
    create_table :broker_payments_sales do |t|
      t.integer :broker_payment_id
      t.integer :sale_id

      t.timestamps
    end
  end
end
