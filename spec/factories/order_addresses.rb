FactoryBot.define do
  factory :order_address do
    postal_code     { '123-456' }
    prefecture_id   { 2 }
    city            { 'あああ' }
    house_number    { 'あああ' }
    building_name   { "" }
    phone_number    { "" }
  end
end