require 'rails_helper'

RSpec.describe 'User Story 2, Surgery Show Page' do
  describe 'As a visitor When I visit a surgery show page' do
    before :each do
      @surgery1 = Surgery.create!(title: "Tonsillectomy", day_of_week: "Monday", operating_room_number: "113")

      @doctor1 = @surgery1.doctors.create!(name: "Meredith Grey", years_experience: 11, university: "Dartmouth")
      @doctor2 = @surgery1.doctors.create!(name: "Carmen Daza", years_experience: 20, university: "Yale")
      @doctor3 = @surgery1.doctors.create!(name: "Andy Cooper", years_experience: 9, university: "George Mason")
      @doctor4 = @surgery1.doctors.create!(name: "Olivia Pope", years_experience: 15, university: "Harvard")

      visit surgery_path(@surgery1)
    end

    it 'Then I see the surgery title, day of the week, and operating room number' do
      expect(page).to have_content(@surgery1.title)
      expect(page).to have_content("Taking place on: #{@surgery1.day_of_week}")
      expect(page).to have_content("In operating room number #{@surgery1.operating_room_number}")
    end

    it 'And I see the names and years practiced of all doctors performing this surgery' do
      within(".doctors") do
        expect(page).to have_content("Doctors performing this surgery")
        within("#doctor-#{@doctor1.id}") do
          expect(page).to have_content(@doctor1.name)
          expect(page).to have_content("#{@doctor1.years_experience} years of experience")
        end
        within("#doctor-#{@doctor2.id}") do
          expect(page).to have_content(@doctor2.name)
          expect(page).to have_content("#{@doctor2.years_experience} years of experience")
        end
        within("#doctor-#{@doctor3.id}") do
          expect(page).to have_content(@doctor3.name)
          expect(page).to have_content("#{@doctor3.years_experience} years of experience")
        end
        within("#doctor-#{@doctor4.id}") do
          expect(page).to have_content(@doctor4.name)
          expect(page).to have_content("#{@doctor4.years_experience} years of experience")
        end
      end
    end

    it 'And I see two sections: Most experienced doctor and Least experienced doctor' do
      within(".most-and-least") do
        expect(page).to have_content("Most experienced doctor:")
        expect(page).to have_content("Least experienced doctor:")
      end
    end

    it 'And in those two sections I see the two doctors who are performing this surgery in the appropriate section including their name and years practiced' do

    end
  end
end
