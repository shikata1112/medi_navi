class Member::EventsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.member_id = current_member.id
    @event.save ? (redirect_to member_event_path(@event)) : (render 'new')
  end

  def index 
    @events = Event.where(member_id: current_member.id)
  end

  def show
  end

  def edit
    unless @event.member == current_member
      redirect_to root_path
    end
  end

  def update
    @event.update(event_params) ? (redirect_to member_event_path(@event)) : (render 'edit')
  end

  def destroy
    @event.destroy
    redirect_to my_calendar_path
  end

  def my_calendar
  end

  private
  
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:member_id, :title, :body, :start_date, :end_date)
  end

end
