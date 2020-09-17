class Member::ClinicsController < ApplicationController

  def top
    @clinics = Clinic.all
  end

  def about
  end

  def index
    @clinics = Clinic.all
  end

  def show
    @clinic = Clinic.find(params[:id])
  end

end
