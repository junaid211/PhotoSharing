class CreateGroupPosts < ActiveRecord::Migration
  def change
    create_table :group_posts do |t|
      t.integer :group_id
      t.text :caption
      t.string :image

      t.timestamps
    end
  end
end
