FactoryBot.define do
  factory :item do
    product_name        { 'お菓子' }
    description         { 'あ甘くて酸っぱい' }
    price               { '99999' }
    category_id            { 2 }
    area_id                { 2 }
    status_id              { 2 }
    delivery_fee_id        { 2 }
    arrival_date_id        { 2 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
