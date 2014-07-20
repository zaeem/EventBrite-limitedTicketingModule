class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :venue_id
      t.string :name
      t.datetime :event_date
      t.text :description
      t.boolean :primary
      t.string :primary_pdf
      t.string :seatgeek_id

      t.timestamps
    end
  end
end
