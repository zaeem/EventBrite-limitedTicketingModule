class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :phone
      t.string :phone_daytime
      t.string :phone_evening
      t.string :phone_cell
      t.string :security_question1
      t.string :security_answer1
      t.boolean :subscribe
      t.integer :sale_commission
      t.integer :negotiation_commission

      t.timestamps
    end
  end
end
