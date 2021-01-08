class OrderAdress
  include ActiveModel: :Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly" }
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number, numericality: {less_than_or_equal_to: 11, message: "Input only number"}
end
