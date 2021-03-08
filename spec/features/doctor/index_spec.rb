require 'rails_helper'

RSpec.describe 'User Story 1, Doctor Index' do
  describe 'As a visitor When I visit the Doctor index' do
    before :each do
      @doctor1 = Doctor.create!(name: "Meredith Grey", years_experience: 11, university: "Dartmouth")
      @doctor2 = Doctor.create!(name: "Carmen Daza", years_experience: 20, university: "Yale")
      @doctor3 = Doctor.create!(name: "Andy Cooper", years_experience: 9, university: "George Mason")
      @doctor4 = Doctor.create!(name: "Olivia Pope", years_experience: 15, university: "Harvard")

      visit doctors_path
    end

    it 'Then I see the all Doctors including their name, years practiced, and university' do
      expect(page).to have_content("Doctors")
      within("#doctors-#{@doctor1.id}") do
        expect(page).to have_content("Name: #{@doctor1.name}")
        expect(page).to have_content("Years Practiced: #{@doctor1.years_experience}")
        expect(page).to have_content("Attended #{@doctor1.university} University")
      end
      within("#doctors-#{@doctor2.id}") do
        expect(page).to have_content("Name: #{@doctor2.name}")
        expect(page).to have_content("Years Practiced: #{@doctor2.years_experience}")
        expect(page).to have_content("Attended #{@doctor2.university} University")
      end
      within("#doctors-#{@doctor3.id}") do
        expect(page).to have_content("Name: #{@doctor3.name}")
        expect(page).to have_content("Years Practiced: #{@doctor3.years_experience}")
        expect(page).to have_content("Attended #{@doctor3.university} University")
      end
      within("#doctors-#{@doctor4.id}") do
        expect(page).to have_content("Name: #{@doctor4.name}")
        expect(page).to have_content("Years Practiced: #{@doctor4.years_experience}")
        expect(page).to have_content("Attended #{@doctor4.university} University")
      end
    end

    it 'And I see that the doctors are listed in order of years practiced from most to least' do
      expect(@doctor2.name).to appear_before(@doctor4.name)
      expect(@doctor4.name).to appear_before(@doctor1.name)
      expect(@doctor1.name).to appear_before(@doctor3.name)
    end
  end
end
