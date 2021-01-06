require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    it 'nameが空だと投稿できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it 'textが空だと投稿できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Text can't be blank"
    end
    it 'priceが空だと投稿できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it 'priceは、半角数字でなければ登録できない' do
      @item.price = '１１１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is not a number'
    end
    it 'priceは299以下では登録できない' do
      @item.price = 10
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be greater than 299'
    end
    it 'priceは10000000以上では登録できない' do
      @item.price = 10000000000
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be less than 10000000'
    end
    it 'category_idが1では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Category must be other than 1'
    end
    it 'condition_idが1では登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Condition must be other than 1'
    end
    it 'day_to_ship_idが1では登録できない' do
      @item.day_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Day to ship must be other than 1'
    end
    it 'prefecture_idが1では登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Prefecture must be other than 1'
    end
    it 'shipping_charge_idが1では登録できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Shipping charge must be other than 1'
    end
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
  end
end
