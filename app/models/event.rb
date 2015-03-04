class Event < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reservations
    has_many :users, through: :reservations

validates :category_id, presence: true
validates :title, presence: true
validates :description, presence: true
validates :date, presence: true
validates :time, presence: true
validates :location, presence: true
end
