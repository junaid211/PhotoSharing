class Group < ActiveRecord::Base
  attr_accessible :group_name ,:user_id
  belongs_to :owned_users , :class_name => "User" ,
             :foreign_key => :group_id
accepts_nested_attributes_for :owned_users
end
