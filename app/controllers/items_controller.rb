class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :new]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item)
          .permit(:image, :price, :product_name, :description, :area_id, :arrival_date_id, :category_id, :delivery_fee_id, :status_id)
          .merge(user_id: current_user.id)
  end
end
