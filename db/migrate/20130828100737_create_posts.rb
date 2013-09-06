class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :caption
      t.integer :group_id
      t.string :image

      t.timestamps
    end
  end
end
