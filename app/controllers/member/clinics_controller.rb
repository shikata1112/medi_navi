class Member::ClinicsController < ApplicationController
  before_action :authenticate_member!, except: :about

  def top
    
    gon.member = current_member
    gon.clinics = Clinic.all
  end

  def about
  end

  def show
    @clinic = Clinic.find(params[:id])
    gon.clinic = @clinic
  end

  # フォームからのあいまい検索
  def search
    @clinics = Clinic.search(params[:search])
  end

  # 診療科目検索
  def genre_search
    @genre = Genre.find(params[:genre_id])
    @clinics = @genre.clinics
    # @clinics = Genre.find(params[:genre_id]).clinics
  end

  # 都道府県検索
  def prefecture_search
    @clinics = Clinic.where("address LIKE?","#{params[:name]}%")
  end

  # 会員住所からの検索
  def api_search
    latitude = params[:latitude]
    longitude = params[:longitude]
    @places = Clinic.all.within(2, origin: [latitude, longitude])
  end

end
