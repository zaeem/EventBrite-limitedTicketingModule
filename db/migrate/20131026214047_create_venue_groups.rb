class CreateVenueGroups < ActiveRecord::Migration
  def change
    create_table :venue_groups do |t|
      t.string :name
      t.integer :rating
      t.integer :venue_id

      t.timestamps
    end
  end
end
