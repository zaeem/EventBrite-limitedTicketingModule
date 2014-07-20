class CreateTicketStatuses < ActiveRecord::Migration
  def change
    create_table :ticket_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
