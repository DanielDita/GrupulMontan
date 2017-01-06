class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event, only: [:show, :edit, :update, :destroy, :like]
  before_action :owned_event, only: [:edit, :update, :destroy]
  impressionist actions: [:show], unique: [:session_hash]
  load_and_authorize_resource


  def index
    @events = Event.where(["title LIKE ?","%#{params[:search]}%"]).all.order("created_at desc").paginate(page: params[:page], per_page: 9)
  end

  def new
    @event = current_user.events.build

  end

  def create
    @event = current_user.events.build(event_params)


    if @event.save
      redirect_to @event, notice: "Evenimentul a fost salvat"
    else
      render 'new'
    end
  end

  def show
    @events = Event.friendly.find(params[:id])
    impressionist(@event)
  end

  def edit
    @events = Event.all.order("created_at desc")
  end

  def update
    @events = Event.all.order("created_at desc")
    if @event.update event_params
      redirect_to @event, notice: "Succes! Postarea a fost salvata!"
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  def like
    if @event.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  private

  def find_event
    @event =Event.friendly.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :date, :description, :link, :slug, :image)
  end

  def owned_event
    unless current_user == @event.user
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to root_path
    end
  end

end
