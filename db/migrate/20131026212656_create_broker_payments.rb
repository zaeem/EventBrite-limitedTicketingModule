class CreateBrokerPayments < ActiveRecord::Migration
  def change
    create_table :broker_payments do |t|
      t.decimal :amount,  :precision => 8, :scale => 2
      t.string :payment_type
      t.string :status

      t.timestamps
    end
  end
end
