class Membership < ActiveRecord::Base
  attr_accessible :group_id, :group_name, :user_id
end
