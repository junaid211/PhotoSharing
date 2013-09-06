require 'digest/sha1'
require 'RMagick'
class User < ActiveRecord::Base
  attr_accessible :email, :hobbies, :name, :password ,:image

  mount_uploader :image,ImageUploader
  has_many :owned_groups , :class_name=> "Group",#:through => :memberships , :source => :groups,
           :foreign_key => :user_id
  has_many :images , :class_name => "Image",
           :foreign_key => :user_id
  has_many :memberships ,
           :foreign_key => :user_id
  has_many :posts
  #attr_protected :password



  accepts_nested_attributes_for :owned_groups
  accepts_nested_attributes_for :images
  validates_length_of :password,:within => 6..50 , presence: true , :on => :create
  validates :name,  :presence => true, :length => { :maximum => 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { :with => VALID_EMAIL_REGEX } ,
  :uniqueness => { :case_sensitive => false }


  def password=(password)
    logger.debug "\n\n\n\n its inside the password field #{password.present?} #{password}"
    write_attribute :password, Digest::SHA1.hexdigest(password) if password.present?
  end


  def self.authenticate(email,password)
    ency_password = Digest::SHA1.hexdigest password
    #logger.debug "****#{email}**** "

    user = User.find_by_email(email)
    7.times { |i| logger.debug "*****#{ user.inspect if i == 4 }*****" }
    if user && user.password == ency_password
      return user
    else
      return false
    end


  end
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end



end
#   def self.authenticate(email="", password="")
#    if VALID_EMAIL_REGEX.match(email)
#       user = User.find_by_email(email)
#    end

#    if user && user.match_password(password)
#      return user
#    else
#      return false
#    end
#   end

    #def match_password(password="")
     # encrypted_password == Digest::SHA1.hexdigest(password)
    #end



