class CreateUploadedTickets < ActiveRecord::Migration
  def change
    create_table :uploaded_tickets do |t|
      t.integer :offer_ticket_id
      t.binary :ticket_file

      t.timestamps
    end
  end
end
