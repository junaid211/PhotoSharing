class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :group_name
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
