require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    it "nameが空だと投稿できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it "textが空だと投稿できない" do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Text can't be blank"
    end
    it "priceが空だと投稿できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it "priceは、半角数字でなければ登録できない" do
      @item.price = "１１１１１１"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it "priceは300円未満では登録できない" do
      @item.price = "10"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than 299"
    end
    it "priceは10000000以上では登録できない" do
      @item.price = "10000000000"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than 10000000"
    end
  end 
end
