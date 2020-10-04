class Member::ClinicsController < ApplicationController
  before_action :authenticate_member!, except: :about

  def top
    gon.member = current_member
    gon.clinics = Clinic.all
    @genres = Genre.all
    @clinics = Clinic.order(impressions_count: 'DESC') # PVソート機能
  end

  def about
  end

  def show
    # impressionist(@clinic, nil, unique: [:session_hash])
    @clinic = Clinic.find(params[:id])
    gon.clinic = @clinic # jsでgon.clinicで@clinicが使用できる
  end

  # フォームからのあいまい検索
  def search
    @clinics = Clinic.search(params[:search])
  end

  # 診療科目検索
  def genre_search
    @genre = Genre.find(params[:genre_id])
    @clinics = @genre.clinics
  end

  # 都道府県検索
  def prefecture_search
    #@clinics = Clinic.preload(:genres).where("address LIKE?", "#{params[:name]}%")
    @clinics = Clinic.eager_load(:genres, :favorites, :consultation_hours, :reviews).where("address LIKE?", "#{params[:name]}%")
  end

  # 会員住所からの検索
  def api_search
    latitude = params[:latitude]
    longitude = params[:longitude]
    @places = Clinic.all.within(2, origin: [latitude, longitude])
  end

  # 並び替え
  def sort
    @clinics = Clinic.sort(params[:clinic][:keyword])
  end

end
