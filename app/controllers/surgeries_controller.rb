class SurgeriesController < ApplicationController
  def show
    @surgery = Surgery.find(params[:id])
  end

  def update
    @surgery = Surgery.find(params[:id])
    @new_doctor = Doctor.find(params[:add_doctor])
    @surgery.doctors << @new_doctor

    redirect_to surgery_path(@surgery)
  end
end
