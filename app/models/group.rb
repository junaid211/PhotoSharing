class Group < ActiveRecord::Base
  attr_accessible :group_name ,:user_id
  has_many :owned_users , :class_name => "User" ,#:through => :memberships , :source => :users ,
             :foreign_key => :group_id
  has_many :memberships
  validates :group_name, presence: true
accepts_nested_attributes_for :owned_users
end
