require 'rails_helper'

RSpec.describe 'As a user' do
  before :each do
    @mechanic1 = Mechanic.create(name: "Cid",
                                 years_of_experience: 4)
    @mechanic2 = Mechanic.create(name: "Tron Bonne",
                                 years_of_experience: 3)
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
    @mechanic1.rides << @ride1
    @mechanic1.rides << @ride2
  end
  describe "When I visit /mechanics/:id"
    it "I see their name, years of exp., & names of rides they’re working on" do

      visit "/mechanics/#{@mechanic1.id}"

      expect(page).to have_content("Mechanic: #{@mechanic1.name}")
      expect(page).to have_content("Years of Experience: #{@mechanic1.years_of_experience}")

      within(".mechanic") do
        expect(page.all('.rides')[0]).to have_content(@ride2.name)
        expect(page.all('.rides')[1]).to have_content(@ride1.name)
      end

    end
    it "I also see a form to add a ride to their workload" do

      visit "/mechanics/#{@mechanic1.id}"

      expect(page).to have_no_content(@ride3.name)

      fill_in('ride', :with => @ride3.id)
      click_button "Submit"

      expect(current_path).to eq("/mechanics/#{@mechanic1.id}")
      expect(page).to have_content(@ride3.name)

      # Try adding the same ride again
      fill_in('ride', :with => @ride3.id)
      click_button "Submit"

      expect(page).to have_content("Ride cannot be added")

      # Try adding an ID with no associated ride
      fill_in('ride', :with => 88789)
      click_button "Submit"

      expect(page).to have_content("Ride cannot be added")

      # Add a ride to another mechanic
      visit "/mechanics/#{@mechanic2.id}"

      fill_in('ride', :with => @ride3.id)
      click_button "Submit"

      expect(current_path).to eq("/mechanics/#{@mechanic2.id}")
      expect(page).to have_content(@ride3.name)

    end
end