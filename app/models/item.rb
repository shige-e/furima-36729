class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :arrival_date
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :status

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  PRICE_REGEX = /\A[0-9]+\z/
  validates :price, presence: true,
                               format: { with: PRICE_REGEX, message: ' is invalid. Input half-width characters' }
  validates :product_name, :description, presence: true
  validates :area_id, :arrival_date_id, :category_id, :delivery_fee_id, :status_id, presence: true
  validates :arrival_date_id, :category_id, :delivery_fee_id, :status_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :area_id, numericality: { other_than: 0, message: "can't be blank" } 
end
