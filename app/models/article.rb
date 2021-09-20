class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :arrival_date
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :status
end
