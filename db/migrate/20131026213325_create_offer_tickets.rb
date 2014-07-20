class CreateOfferTickets < ActiveRecord::Migration
  def change
    create_table :offer_tickets do |t|
      t.integer :offer_id
      t.integer :venue_row_id
      t.string :status
      t.integer :seat_number
      t.string :barcode
      t.string :attendee_name

      t.timestamps
    end
  end
end
