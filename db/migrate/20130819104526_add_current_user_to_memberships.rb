class AddCurrentUserToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :current_user, :integer
  end
end
