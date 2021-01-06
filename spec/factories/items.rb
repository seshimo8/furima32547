FactoryBot.define do
  factory :item do
    name              { 'test' }
    text              { 'test' }
    price             { 1000 }
    category_id       { 2 }
    condition_id      { 2 }
    shipping_charge_id{ 2 }
    prefecture_id     { 2 }
    day_to_ship_id    { 2 }


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
