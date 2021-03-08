require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe 'relationships' do
    it { should have_many :doctor_surgeries}
    it { should have_many(:doctors).through(:doctor_surgeries)}
  end

  describe 'instance methods' do
    describe '#most_experienced_doctor' do
      it 'returns the doctor performing the surgery with the most experience' do
        @surgery1 = Surgery.create!(title: "Tonsillectomy", day_of_week: "Monday", operating_room_number: "113")

        @doctor1 = @surgery1.doctors.create!(name: "Meredith Grey", years_experience: 11, university: "Dartmouth")
        @doctor2 = @surgery1.doctors.create!(name: "Carmen Daza", years_experience: 20, university: "Yale")
        @doctor3 = @surgery1.doctors.create!(name: "Andy Cooper", years_experience: 9, university: "George Mason")
        @doctor4 = @surgery1.doctors.create!(name: "Olivia Pope", years_experience: 15, university: "Harvard")

        expect(@surgery1.most_experienced_doctor).to eq(@doctor2)
      end
    end

    describe '#least_experienced_doctor' do
      it 'returns the doctor performing the surgery with the least experience' do
        @surgery1 = Surgery.create!(title: "Tonsillectomy", day_of_week: "Monday", operating_room_number: "113")

        @doctor1 = @surgery1.doctors.create!(name: "Meredith Grey", years_experience: 11, university: "Dartmouth")
        @doctor2 = @surgery1.doctors.create!(name: "Carmen Daza", years_experience: 20, university: "Yale")
        @doctor3 = @surgery1.doctors.create!(name: "Andy Cooper", years_experience: 9, university: "George Mason")
        @doctor4 = @surgery1.doctors.create!(name: "Olivia Pope", years_experience: 15, university: "Harvard")

        expect(@surgery1.least_experienced_doctor).to eq(@doctor3)
      end
    end

    describe '#average_doctors_experience' do
      it 'returns the average years of experience for that surgery doctors' do
        @surgery2 = Surgery.create!(title: "Caesarean Section", day_of_week: "Friday", operating_room_number: "203")

        @doctor2 = @surgery2.doctors.create!(name: "Carmen Daza", years_experience: 20, university: "Yale")
        @doctor3 = @surgery2.doctors.create!(name: "Andy Cooper", years_experience: 9, university: "George Mason")
        @doctor4 = @surgery2.doctors.create!(name: "Olivia Pope", years_experience: 15, university: "Harvard")

        expect(@surgery2.average_doctors_experience).to eq(15)
      end
    end
  end
end
