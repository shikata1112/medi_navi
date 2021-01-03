class Api::ClinicsController < ApplicationController
  # before_action :authenticate_member!, except: :about

  def index
    logger.debug '==================================================================================================================='
    @clinics = Clinic.all
    render formats: :json
  end
end
