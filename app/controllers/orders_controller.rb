class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_information = OrderInformation.new
  end


  def create
    @item = Item.find(params[:item_id])
    @order_information = OrderInformation.new(order_params)
    if @order_information.valid?
      @order_information.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_information).permit(:postal_code, :area_id, :city, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
