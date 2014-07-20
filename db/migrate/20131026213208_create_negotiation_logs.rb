class CreateNegotiationLogs < ActiveRecord::Migration
  def change
    create_table :negotiation_logs do |t|
      t.integer :bid_id
      t.integer :offer_id
      t.decimal :price,  :precision => 8, :scale => 2
      t.integer :quantity
      t.string :negotiation_type

      t.timestamps
    end
  end
end
