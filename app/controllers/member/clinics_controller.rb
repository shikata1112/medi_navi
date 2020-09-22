class Member::ClinicsController < ApplicationController

  def top
  end

  def about
  end

  def show
    @clinic = Clinic.find(params[:id])
  end

  def search
    @clinics = Clinic.search(params[:search])
  end

  def genre_search
    @genre = Genre.find(params[:genre_id])
    @clinics = @genre.clinics
    # @clinics = Genre.find(params[:genre_id]).clinics
  end

  def prefecture_search
    @clinics = Clinic.where("address LIKE?","#{params[:name]}%")
  end

end
