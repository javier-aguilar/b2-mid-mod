class Mechanic < ApplicationRecord

  validates :name, presence: true
  validates :years_of_experience, numericality: true

  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def add_ride(ride_id)
    ride = Ride.find(ride_id) if Ride.exists?(ride_id) 
    if ride && (!rides.include? ride)
      rides << ride
    end
  end

end
