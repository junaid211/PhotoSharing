class AddUserNameToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :user_name, :string
  end
end
