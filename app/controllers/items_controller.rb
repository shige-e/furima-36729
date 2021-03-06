class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :new]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  

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

  def show
  end

  def edit
    redirect_to action: :index and return unless @item.user_id == current_user.id
    redirect_to root_path if @item.order.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item)
          .permit(:image, :price, :product_name, :description, :area_id, :arrival_date_id, :category_id, :delivery_fee_id, :status_id)
          .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
