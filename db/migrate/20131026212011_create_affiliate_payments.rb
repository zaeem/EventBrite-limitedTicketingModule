class CreateAffiliatePayments < ActiveRecord::Migration
  def change
    create_table :affiliate_payments do |t|
      t.integer :user_id
      t.decimal :amount,  :precision => 8, :scale => 2
      t.string :affiliate_type
      t.string :status

      t.timestamps
    end
  end
end
