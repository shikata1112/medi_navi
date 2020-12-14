class Member::ClinicsController < ApplicationController
  before_action :authenticate_member!, except: :about

  def top
    @clinic_all = Clinic.eager_load(:reviews).all
    @clinic_all_json = @clinic_all.to_json.html_safe
    @genres = Genre.all
    @clinics = Clinic.order(impressions_count: 'DESC').limit(10) # PVソート機能
    @histories = ClinicHistory.eager_load(:clinic).where(member_id: current_member.id)
  end

  def about
  end

  def show
    @clinic = Clinic.find(params[:id])
    impressionist(@clinic, nil, unique: [:impressionable_id, :ip_address])
    @clinic.clinic_histories.create_and_destroy_history(current_member, @clinic.id)
  end

  # フォームからのあいまい検索
  def search
    @clinics = Clinic.clinics_load.search(params[:search])
  end

  # 診療科目検索
  def genre_search
    @genre = Genre.find(params[:genre_id])
    @clinics = @genre.clinics.clinics_load
  end

  # 都道府県検索
  def prefecture_search
    @clinics = Clinic.clinics_load.where("address LIKE?", "#{params[:name]}%")
  end

  # 会員住所からの検索
  def api_search
    latitude = params[:latitude]
    longitude = params[:longitude]
    @places = Clinic.all.within(2, origin: [latitude, longitude])
  end

end
