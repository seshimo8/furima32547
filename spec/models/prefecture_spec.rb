require 'rails_helper'

RSpec.describe Prefecture, type: :model do
  describe "商品出品" do
    it "prefecture_idが1では登録できない" do
      item = Item.new(prefecture_id:1)
      item.valid?
      expect(item.errors.full_messages).to include("Prefecture must be other than 1")
    end
  end
end
