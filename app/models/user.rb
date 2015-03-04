class User < ActiveRecord::Base
has_secure_password

has_many :events
has_many :reservations


validates :name, presence: true
validates :email, presence: true
validates :password, presence: true
validates :tandc, presence: true
end
