class Admin::ClinicsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @clinic = Clinic.new
    @clinic.consultation_hours.build
    @genres = Genre.all
  end

  def create 
    if @clinic = Clinic.create(clinic_params)
        clinic_params[:genre_ids].each do |genre_id|
          genre_map = GenreMap.new(genre_id: genre_id,clinic_id:@clinic.id)
          genre_map.save
        end
        redirect_to admin_clinics_path
    else
      render 'new'
    end
  end

  def index
    @clinics = Clinic.all
  end

  def show
    @clinic = Clinic.find(params[:id])
  end

  def edit
    @clinic = Clinic.find(params[:id])
    @clinic.genre_ids = @clinic.genre_maps.pluck(:genre_id)
    @genres = Genre.all
    @new_clinic = Clinic.new
    @new_clinic.consultation_hours.build
  end

  def update
    @clinic = Clinic.find(params[:id])
    if @clinic.update(clinic_params)
      @clinic.genre_maps.destroy_all
      clinic_params[:genre_ids].each do |genre_id|
        genre_map = GenreMap.new(genre_id: genre_id,clinic_id:@clinic.id)
        genre_map.save
      end
        redirect_to edit_admin_clinic_path(@clinic)
    else
      render 'edit'
    end
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
      genre_ids: [],
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
