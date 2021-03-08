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
    end

    it 'And I see the names and years practiced of all doctors performing this surgery' do
    end

    it 'And I see two sections: Most experienced doctor and Least experienced doctor' do
    end

    it 'And in those two sections I see the two doctors who are performing this surgery in the appropriate section including their name and years practiced' do
    end
  end
end
