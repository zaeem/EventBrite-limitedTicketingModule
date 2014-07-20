class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :category
      t.string :subcategory
      t.string :name
      t.string :team
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.text :description
      t.string :school
      t.string :team_name
      t.string :mascot
      t.string :seatgeek_id
      t.string :photo

      t.timestamps
    end
  end
end
