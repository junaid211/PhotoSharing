class Membership < ActiveRecord::Base
  attr_accessible :group_id, :group_name, :user_id , :current_user, :user_name
  belongs_to :users
  belongs_to :groups
end
