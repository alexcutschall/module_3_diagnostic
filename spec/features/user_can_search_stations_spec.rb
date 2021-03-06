require 'rails_helper'

describe 'as a user' do
  describe 'when I visit the root path' do
    context 'and they search for stations' do
      it 'shows them the ten closest stations within 6 miles' do
        user = User.create(name: "Alex")

        visit '/'
        within(:css, "nav") do
          fill_in 'q', :with => '80208'
        end
        click_on "Locate"

        expect(current_path).to eq("/search")
        expect(page).to have_css(".station", :count => 10)
        # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
        expect(page).to have_content("ELEC")
        expect(page).to_not have_content("BD")
        expect(page).to_not have_content("E85")
        expect(page).to_not have_content("CNG")
        expect(page).to_not have_content("HY")
        expect(page).to_not have_content("LNG")
        # And the stations should be limited to Electric and Propane
        first(".station") do
          expect(page).to have_content("Name")
          expect(page).to have_content("Address")
          expect(page).to have_content("Fuel Type")
          expect(page).to have_content("Distance")
          expect(page).to have_content("Access Times")
        end
        all(".station").last do
          expect(page).to have_content("Name")
          expect(page).to have_content("Address")
          expect(page).to have_content("Fuel Type")
          expect(page).to have_content("Distance")
          expect(page).to have_content("Access Times")
        end
        # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      end
    end
  end
end
