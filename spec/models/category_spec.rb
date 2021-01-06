require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "商品出品" do
    it "category_idが1では登録できない" do
      item = Item.new(category_id:1)
      item.valid?
      binding.pry
      expect(item.errors.full_messages).to include("Category must be other than 1")
    end
  end
end
