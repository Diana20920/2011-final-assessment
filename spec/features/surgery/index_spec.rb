require 'rails_helper'

RSpec.describe 'Extension, Surgery Index' do
  describe 'As a visitor When I visit the surgery index' do
    before :each do
      @surgery1 = Surgery.create!(title: "Tonsillectomy", day_of_week: "Monday", operating_room_number: "113")
      @surgery2 = Surgery.create!(title: "Caesarean Section", day_of_week: "Friday", operating_room_number: "203")
      @surgery3 = Surgery.create!(title: "Heart Bypass", day_of_week: "Wednesday", operating_room_number: "105")

      @doctor1 = @surgery1.doctors.create!(name: "Meredith Grey", years_experience: 11, university: "Dartmouth")
      @doctor2 = @surgery3.doctors.create!(name: "Carmen Daza", years_experience: 20, university: "Yale")
      @doctor3 = @surgery2.doctors.create!(name: "Andy Cooper", years_experience: 9, university: "George Mason")
      @doctor4 = @surgery2.doctors.create!(name: "Olivia Pope", years_experience: 15, university: "Harvard")

      visit surgeries_path
    end

    it 'I see each surgery including its title, day of week, and operating room number' do
      expect(page).to have_content("Surgeries")
      within("#surgery-#{@surgery1.id}") do
        expect(page).to have_content(@surgery1.title)
        expect(page).to have_content(@surgery1.day_of_week)
        expect(page).to have_content(@surgery1.operating_room_number)
      end
      within("#surgery-#{@surgery2.id}") do
        expect(page).to have_content(@surgery2.title)
        expect(page).to have_content(@surgery2.day_of_week)
        expect(page).to have_content(@surgery2.operating_room_number)
      end
      within("#surgery-#{@surgery3.id}") do
        expect(page).to have_content(@surgery3.title)
        expect(page).to have_content(@surgery3.day_of_week)
        expect(page).to have_content(@surgery3.operating_room_number)
      end
    end

    it 'And next to each surgery I see the average years practiced of doctors performing that surgery' do
      within("#surgery-#{@surgery1.id}") do
        expect(page).to have_content("Average years of practice for doctors: #{@surgery1.average_doctors_experience}")
      end
      within("#surgery-#{@surgery2.id}") do
        expect(page).to have_content("Average years of practice for doctors: #{@surgery2.average_doctors_experience}")
      end
      within("#surgery-#{@surgery3.id}") do
        expect(page).to have_content("Average years of practice for doctors: #{@surgery3.average_doctors_experience}")
      end
    end

    it 'And I see that the surgeries on this page are ordered by average years practiced from greatest to least' do
    end
  end
end

# (Note: you should not make a separate query for each surgery to calculate the average doctor years practiced)
# after seeing note, I am thinking if I should create a class method for surgeries or doctor_surgeries that will perform this query. 
