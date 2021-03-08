require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships' do
    it { should have_many :doctor_surgeries}
    it { should have_many(:surgeries).through(:doctor_surgeries)}
  end

  describe 'class methods' do
    describe '::order_by_most_experience' do
      it 'sorts all doctors from most experience to least' do
        @doctor1 = Doctor.create!(name: "Meredith Grey", years_experience: 11, university: "Dartmouth")
        @doctor2 = Doctor.create!(name: "Carmen Daza", years_experience: 20, university: "Yale")
        @doctor3 = Doctor.create!(name: "Andy Cooper", years_experience: 9, university: "George Mason")
        @doctor4 = Doctor.create!(name: "Olivia Pope", years_experience: 15, university: "Harvard")

        expect((Doctor.order_by_most_experience).first).to eq(@doctor2)
        expect((Doctor.order_by_most_experience).last).to eq(@doctor3)
      end
    end
  end
end
