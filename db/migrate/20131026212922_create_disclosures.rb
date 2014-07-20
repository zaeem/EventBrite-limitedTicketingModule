class CreateDisclosures < ActiveRecord::Migration
  def change
    create_table :disclosures do |t|
      t.string :name

      t.timestamps
    end
  end
end
