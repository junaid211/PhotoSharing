require 'digest/sha1'
require 'RMagick'
class User < ActiveRecord::Base
  attr_accessible :email, :hobbies, :name, :password ,:image
  mount_uploader :image,ImageUploader
  has_many :owned_groups , :class_name=> "Group",
           :foreign_key => :user_id
  has_many :images , :class_name => "Image",
           :foreign_key => :user_id


  accepts_nested_attributes_for :owned_groups
  accepts_nested_attributes_for :images
  #validates :password, length:{ minimum:6 }, :presence => true
  validates :name,  :presence => true, :length => { :maximum => 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { :with => VALID_EMAIL_REGEX } ,
  :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true

  validates_length_of :password, :in => 6..50, :on => :create


  #has_secure_password
  def password=(password)
    write_attribute :password, Digest::SHA1.hexdigest(password)
  end

  def self.authenticate(email,password)
      ency_password = Digest::SHA1.hexdigest password
      user = User.find_by_email_and_password(email,ency_password)
  end



  end
 #   def self.authenticate(email="", password="")
  #    if VALID_EMAIL_REGEX.match(email)
  #      user = User.find_by_email(email)
   #   end

    # if user && user.match_password(password)
     #   return user
      #else
       # return false
     # end
    #end

    #def match_password(password="")
     # encrypted_password == Digest::SHA1.hexdigest(password)
    #end



