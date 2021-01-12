class RecordsController < ApplicationController

  def index
    @record_order = RecordOrder.new
  end

  def create
    @record_order = RecordOrder.new(render_params)
    if @record_order.valid?
      @record_order.save
      redirect_to item_path, method: :get
    else
      render  action: :index
    end
  end

  private

  def render_params
    params.permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number)
  end

end
