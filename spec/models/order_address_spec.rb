require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'prefecture_idが1では登録できない' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'cityが空では登録できない' do
      @order_address.city =""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空では登録できない' do
      @order_address.house_number =""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it '郵便番号にハイフンが含まれていないと登録できない' do
      @order_address.postal_code =111111
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
    end
    it '電話番号は11桁以下の数字以外は保存できない' do
      @order_address.postal_code = "fddjjdjddd"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Input only number")
    end
  end
end
