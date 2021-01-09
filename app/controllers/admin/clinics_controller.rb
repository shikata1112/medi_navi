class Admin::ClinicsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]

  def new
    @clinic = Clinic.new
    @clinic.consultation_hours.build
    @genres = Genre.all
  end

  def create
    @clinic = Clinic.new(clinic_params)
    clinic_collection = ClinicCollection.new(@clinic, clinic_params[:genre_ids])
    clinic_collection.save!
    redirect_to admin_clinics_path
  rescue => e
    @genres = Genre.all
    render 'new'
  end

  def index
    @clinics = Clinic.all
  end

  def show
  end

  def edit
    @clinic.genre_ids = @clinic.genre_maps.pluck(:genre_id)
    @genres = Genre.all
    @new_clinic = Clinic.new
    @new_clinic.consultation_hours.build
  end

  def update
    @clinic.update(clinic_params)
    clinic_collection = ClinicCollection.new(@clinic, clinic_params[:genre_ids])
    clinic_collection.update!
    redirect_to admin_clinics_path
  rescue => e 
    @new_clinic = Clinic.new
    @genres = Genre.all
    render 'edit'
  end

  def destroy
    @clinic.destroy
    redirect_to admin_clinics_path
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:id])
  end
  
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
      genre_ids: [],
      consultation_hours:[
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
