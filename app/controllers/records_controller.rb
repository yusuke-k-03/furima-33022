class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record, only: [:new, :create]

    
  def new
      if @item.record == nil
         unless @item.user_id == current_user.id 
           @record_order = RecordOrder.new
         else
           redirect_to root_path
         end
      else
        redirect_to root_path
      end
  end


  def create
    
    @record_order = RecordOrder.new(render_params)
    if @record_order.valid?
       pay_item
      @record_order.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def render_params
    params.require(:record_order).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :record_id).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def set_record
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: render_params[:token],   
      currency: 'jpy'          
    )
  end


end
