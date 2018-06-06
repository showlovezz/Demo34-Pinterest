class PinsController < ApplicationController

  before_action :find_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.order("created_at DESC")
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)

    if @pin.save
      redirect_to pins_path, notice: "Pin 建立成功"
    else
      render "new", alert: "Pin 建立失敗"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pin.update(pin_params)
      redirect_to pins_path, notice: "Pin 修改成功"
    else
      redirect_to "edit", notice: "Pin 修改失敗"
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_path, notcie: "Pin 被刪除"
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end

end
