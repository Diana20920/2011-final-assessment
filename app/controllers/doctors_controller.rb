class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.order_by_most_experience
  end
end
