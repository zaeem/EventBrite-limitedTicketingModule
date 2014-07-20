class CreateOfferDisclosures < ActiveRecord::Migration
  def change
    create_table :offer_disclosures do |t|
      t.integer :offer_id
      t.integer :disclosure_id

      t.timestamps
    end
  end
end
