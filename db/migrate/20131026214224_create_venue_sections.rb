class CreateVenueSections < ActiveRecord::Migration
  def change
    create_table :venue_sections do |t|
      t.integer :venue_id
      t.string :raphael_date
      t.string :color
      t.string :section_text
      t.string :section_number
      t.integer :row_start
      t.integer :row_end
      t.string :photo

      t.timestamps
    end
  end
end
