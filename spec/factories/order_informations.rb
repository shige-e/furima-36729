FactoryBot.define do
  factory :order_information do
    postal_code { '123-4567' }
    area_id { 1 }
    city { '東京都' }
    address { '立川' }
    building_name { '東京ハイツ' }
    telephone_number {11111111111}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
