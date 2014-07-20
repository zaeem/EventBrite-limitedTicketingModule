class CreateVenueRows < ActiveRecord::Migration
  def change
    create_table :venue_rows do |t|
      t.integer :venue_section_id
      t.integer :venue_group_id
      t.string :name
      t.integer :seats

      t.timestamps
    end
  end
end
