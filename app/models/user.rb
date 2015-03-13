class User < ActiveRecord::Base
has_secure_password

has_many :events
has_many :reservations

 has_attached_file :avatar, 
 :styles => { :medium => "300x300>", :thumb => "90x90>" }, 
 :default_url => ":style/missing.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

validates :name, presence: true
validates :email, presence: true
validates :password, presence: true
validates :tandc, presence: true
end
