class Api::ClinicsController < ApplicationController
  # before_action :authenticate_member!, except: :about

  def index
    @clinics = Clinic.all
    render formats: :json
  end
end
