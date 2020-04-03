require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_numericality_of :years_of_experience}
  end

  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'instance methods'
    it "mechanic#add_ride" do

      mechanic1 = Mechanic.create(name: "Cid",
                                   years_of_experience: 4)
      park1 = Park.create(name: "Disney World",
                          admission: 95.00)
      ride1 = Ride.create(name: "Space Mountain",
                          thrill_rating: 8,
                          park_id: park1.id)

      mechanic1.add_ride(ride1.id)

      expect(mechanic1.rides).to include(ride1)
    end

end