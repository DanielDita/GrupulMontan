class PinsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :like]
  before_action :owned_pin, only: [:edit, :update, :destroy]
  impressionist actions: [:show], unique: [:session_hash]
  load_and_authorize_resource

  def index
    @pins = Pin.where(["title LIKE ?","%#{params[:search]}%"]).all.order("created_at DESC").paginate(page: params[:page], per_page: 30)
  end

  def show
    impressionist(@pin)
  end

  def new
    @pin = current_user.pins.build
  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to @pin, notice: "Sfat nou creat cu success"
    else
      render.new
    end
  end

  def edit
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Sfatul a fost actualizat!"
    else
      render 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to root_path
  end

  def like
    if @pin.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image, :like)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end

  def owned_pin
  unless current_user == @pin.user
    flash[:alert] = "That post doesn't belong to you!"
    redirect_to root_path
  end
end

end
