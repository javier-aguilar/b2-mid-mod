require 'rails_helper'

RSpec.describe 'As a user' do
  before :each do
    @park1 = Park.create(name: "Hershey Park",
                         admission: 50.00)
    @park2 = Park.create(name: "Disney World",
                         admission: 95.00)
    @ride1 = Ride.create(name: "Space Mountain",
                         thrill_rating: 8,
                         park_id: @park2.id)
    @ride2 = Ride.create(name: "It's A Small World",
                         thrill_rating: 1,
                         park_id: @park2.id)
    @ride3 = Ride.create(name: "Splash Mountain",
                        thrill_rating: 9,
                        park_id: @park2.id)
  end
  describe "When I visit /parks/:id"
    it "I see the name and price of admissions for that park" do
      visit "/parks/#{@park1.id}"

      expect(page).to have_content(@park1.name)
      expect(page).to have_content("$#{@park1.admission}")

    end
    it "I see names of all rides that this park listed in alphabetical order" do
      visit "/parks/#{@park2.id}"

      within(".rides") do
        expect(page.all('li')[0]).to have_content(@ride2.name)
        expect(page.all('li')[1]).to have_content(@ride1.name)
        expect(page.all('li')[2]).to have_content(@ride3.name)
      end

    end
    it "I see the average thrill rating of this amusement park’s rides" do
      visit "/parks/#{@park2.id}"

      expect(page).to have_content("6.0/10")
    end
end