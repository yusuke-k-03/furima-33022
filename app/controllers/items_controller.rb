class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
   @item = Item.create(item_params)
    if @item.valid? 
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if item.update(item_params)
      redirect_to root_path
    else
      render:edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sale_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end


end
