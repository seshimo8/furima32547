require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先の保存' do
    before do
      sleep 2
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, item_id: @item.id, user_id: @user.id)
     
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
    it '電話番号が空では購入できない' do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が数字であっても12桁以上の場合に購入ができないこと' do
      @order_address.phone_number = "11111111111111111"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Input only number")
    end
    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
    it 'user_idが空では登録できない' do
      @order_address.user_id =""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では登録できない' do
      @order_address.item_id =""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
  end
end
