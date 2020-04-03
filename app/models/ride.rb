class Ride < ApplicationRecord

  validates :name, presence: true
  validates :thrill_rating, numericality: true

  belongs_to :park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  default_scope { order(name: :asc) }

end
