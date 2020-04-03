require 'rails_helper'

RSpec.describe 'As a user' do
  before :each do
    @mechanic1 = Mechanic.create(name: "Cid",
                                 years_of_experience: 4)
    @mechanic2 = Mechanic.create(name: "Tron Bonne",
                                 years_of_experience: 3)
  end
  describe "When I visit /mechanics"
    it "I see a header saying 'All Mechanics'" do
      visit "/mechanics"

      within(".mechanics") do
        expect(page).to have_content("All Mechanics")
      end
    end
    it "I see a list of all mechanic's names and years of experience" do
      visit "/mechanics"

      within("#mechanic-#{@mechanic1.id}") do
        expect(page).to have_content(@mechanic1.name)
        expect(page).to have_content(@mechanic1.years_of_experience)
      end

      within("#mechanic-#{@mechanic2.id}") do 
        expect(page).to have_content(@mechanic2.name)
        expect(page).to have_content(@mechanic2.years_of_experience)
      end
    end
end