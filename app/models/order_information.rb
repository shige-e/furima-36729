class OrderInformation
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address, :building_name, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :user_id, :item_id, :city, :address
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :area_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Information.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end