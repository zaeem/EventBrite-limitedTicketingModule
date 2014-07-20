class CreateEventDisclosures < ActiveRecord::Migration
  def change
    create_table :event_disclosures do |t|
      t.integer :event_id
      t.integer :disclosure_id
      t.string :venue_section_id

      t.timestamps
    end
  end
end
