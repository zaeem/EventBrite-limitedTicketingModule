class CreateCouponCodes < ActiveRecord::Migration
  def change
    create_table :coupon_codes do |t|
      t.string :code
      t.string :discount_type
      t.decimal :amount,  :precision => 8, :scale => 2
      t.integer :quantity
      t.datetime :starts_at
      t.datetime :expires_at

      t.timestamps
    end
  end
end
