class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :venue_group_id
      t.integer :ticket_type_id
      t.decimal :price,  :precision => 8, :scale => 2
      t.integer :quantity
      t.decimal :proxy,  :precision => 8, :scale => 2
      t.integer :multiple
      t.boolean :cancel_others
      t.string :status
      t.date :in_hand_date
      t.date :expected_ship_date
      t.boolean :is_negotiation
      t.datetime :expires_at
      t.boolean :confirm_transaction
      t.boolean :piggy_backed
      t.text :notes

      t.timestamps
    end
  end
end
