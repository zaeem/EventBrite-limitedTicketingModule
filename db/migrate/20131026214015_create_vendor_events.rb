class CreateVendorEvents < ActiveRecord::Migration
  def change
    create_table :vendor_events do |t|
      t.integer :event_id
      t.integer :vendor_id

      t.timestamps
    end
  end
end
