class Admin::ClinicsController < ApplicationController


  def new
    @clinic = Clinic.new
    @clinic.consultation_hours.build
  end

  def create 
    @clinic = Clinic.create(clinic_params)
    redirect_to admin_clinics_path
  end

  def index
    @clinics = Clinic.all
  end

  def show
    @clinic = Clinic.find(params[:id])
  end

  def edit
    @clinic = Clinic.find(params[:id])
    @new_clinic = Clinic.new
    @new_clinic.consultation_hours.build
  end

  def update
    @clinic = Clinic.find(params[:id])
    @clinic.update(clinic_params)
    redirect_to edit_admin_clinic_path(@clinic)
  end

  def destroy
    @clinic = Clinic.find(params[:id])
    @clinic.destroy
    redirect_to admin_clinics_path
  end

  private

  def clinic_params
    params.require(:clinic).permit(
      :name,
      :doctor, 
      :postcode,
      :address, 
      :nearest_station,
      :phone_number, 
      :image,
      :official_site,
      :explanation,
      :is_active,
      { images: []},
      consultation_hours_attributes:[
        :id,
        :clinic_id,
        :start_time,
        :finish_time,
        :mo_time,
        :tu_time,
        :we_time,
        :th_time,
        :fr_time,
        :sa_time,
        :su_time,
        :ho_time,
        :_destroy
        ]
    )
  end

end
