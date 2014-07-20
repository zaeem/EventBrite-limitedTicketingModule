class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :user_group_id
      t.integer :created_by

      t.timestamps
    end
  end
end
