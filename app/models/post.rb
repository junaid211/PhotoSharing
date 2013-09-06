class Post < ActiveRecord::Base
  attr_accessible :caption, :group_id, :image ,:user_name
  mount_uploader :image,ImageUploader
  validates :caption, presence: true
  validates :image, presence: true
  has_many :comments
  belongs_to :users
end
