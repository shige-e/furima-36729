class OrderInformation
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address, :building_name, :telephone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid.can't be blank"}
    validates :user_id, :order_id, :item_id, :city, :address
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :area_id, numericality: {other_than: 0, message: "can't be blank"}


  private

  def order_params
    params.merge(user_id: current_user.id, item_id: @item.id)
  end

  def information_params
    params.permit(:postal_code, :area_id, :city, :address, :building_name, :telephone_number).merge(order_id: @order.id)
  end
end