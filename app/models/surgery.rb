class Surgery < ApplicationRecord
  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def most_experienced_doctor
    doctors.order_by_most_experience.first
  end

  def least_experienced_doctor
    doctors.order_by_most_experience.last
  end

  def average_doctors_experience
    doctors.average(:years_experience).ceil
  end
end
