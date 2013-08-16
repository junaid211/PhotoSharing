class Image < ActiveRecord::Base
  attr_accessible :image, :user_id
  mount_uploader :image ,ImageUploader
  belongs_to :users , :class_name => "User"
  accepts_nested_attributes_for :users
end
