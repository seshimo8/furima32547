require 'rails_helper'

RSpec.describe DayToShip, type: :model do
  describe '商品出品' do
    it 'day_to_ship_idが1では登録できない' do
      item = Item.new(day_to_ship_id: 1)
      item.valid?
      expect(item.errors.full_messages).to include('Day to ship must be other than 1')
    end
  end
end
