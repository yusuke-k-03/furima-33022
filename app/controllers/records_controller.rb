class RecordsController < ApplicationController

    
  def new
    @record_order = RecordOrder.new
  end


  def create

    @record_order = RecordOrder.new(render_params)
    if @record_order.valid?
      @record_order.save
      redirect_to root_path
    else
      render  action: :new
    end
  end

  private

  def render_params
    params.permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :record_id).merge(user_id: current_user.id)
  end

end
