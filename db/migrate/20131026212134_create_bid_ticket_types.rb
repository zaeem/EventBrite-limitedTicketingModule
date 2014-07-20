class CreateBidTicketTypes < ActiveRecord::Migration
  def change
    create_table :bid_ticket_types do |t|
      t.integer :bid_id
      t.integer :ticket_type_id

      t.timestamps
    end
  end
end
