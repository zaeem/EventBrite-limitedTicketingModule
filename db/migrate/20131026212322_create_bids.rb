class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :venue_group_id
      t.decimal :price,  :precision => 8, :scale => 2
      t.integer :quantity
      t.decimal :proxy,  :precision => 8, :scale => 2
      t.datetime :expires_at
      t.boolean :cancel_others
      t.string :status
      t.date :in_hand_date
      t.boolean :is_negotiation
      t.date :expected_ship_date

      t.timestamps
    end
  end
end
