class CreateBrokerDetails < ActiveRecord::Migration
  def change
    create_table :broker_details do |t|
      t.integer :user_id
      t.integer :kickback_percentage
      t.decimal :kickback_flat_fee,  :precision => 8, :scale => 2
      t.string :kickback_type
      t.integer :reduction_percentage
      t.decimal :reduction_flat_fee,  :precision => 8, :scale => 2
      t.string :reduction_type
      t.decimal :payment_threshold,  :precision => 8, :scale => 2
      t.boolean :locked
      t.string :payment_method
      t.boolean :payments_active

      t.timestamps
    end
  end
end
