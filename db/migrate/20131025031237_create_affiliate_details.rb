class CreateAffiliateDetails < ActiveRecord::Migration
  def change
    create_table :affiliate_details do |t|
      t.integer :user_id
      t.integer :percentage
      t.decimal :flat_fee, :precision => 8, :scale => 2
      t.string :commissionable_type
      t.decimal :payment_threshold,  :precision => 8, :scale => 2
      t.boolean :locked
      t.string :payment_method
      t.string :affiliate_token
      t.boolean :token_active
      t.boolean :payments_active

      t.timestamps
    end
  end
end
