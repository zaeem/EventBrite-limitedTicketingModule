class CreateAffiliatePaymentsSales < ActiveRecord::Migration
  def change
    create_table :affiliate_payments_sales do |t|
      t.integer :affiliate_payment_id
      t.integer :sale_id

      t.timestamps
    end
  end
end
