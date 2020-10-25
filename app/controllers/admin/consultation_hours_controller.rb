class Admin::ConsultationHoursController < ApplicationController
  before_action :authenticate_admin!


  def create 
    @consultation_hour = ConsultationHour.new(consultation_hour_params)
    @consultation_hour.save
    redirect_to edit_admin_clinic_path(@consultation_hour.clinic_id)
  end

  def update 
    @consultation_hour = ConsultationHour.find(params[:id])
    @consultation_hour.update(consultation_hour_params)
    redirect_to edit_admin_clinic_path(@consultation_hour.clinic_id)
  end

  def destroy
    @consultation_hour = ConsultationHour.find(params[:id])
    @consultation_hour.destroy
    redirect_to edit_admin_clinic_path(@consultation_hour.clinic_id)
  end

  private

  def consultation_hour_params
    params.require(:consultation_hour).permit(
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
      :ho_time
    )
  end

end
