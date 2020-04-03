require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :admission}
  end

  describe 'relationships' do
    it {should have_many :rides}
  end

  describe 'instance methods'
    it 'park#average_thrill_rating' do

    park1 = Park.create(name: "Disney World",
                         admission: 95.00)
    ride1 = Ride.create(name: "Space Mountain",
                         thrill_rating: 5,
                         park_id: park1.id)
    ride2 = Ride.create(name: "It's A Small World",
                         thrill_rating: 7,
                         park_id: park1.id)
    ride3 = Ride.create(name: "Splash Mountain",
                        thrill_rating: 9,
                        park_id: park1.id)
    expect(park1.average_thrill_rating).to eq(7.0)
    
  end
end