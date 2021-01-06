require 'rails_helper'

RSpec.describe ShippingCharge, type: :model do
  describe "商品出品" do
    it "shipping_charge_idが1では登録できない" do
      item = Item.new(shipping_charge_id:1)
      item.valid?
      binding.pry
      expect(item.errors.full_messages).to include("Shipping charge must be other than 1")
    end
  end
end

