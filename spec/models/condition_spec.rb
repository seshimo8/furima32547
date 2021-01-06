require 'rails_helper'

RSpec.describe Condition, type: :model do
  describe '商品出品' do
    it 'condition_idが1では登録できない' do
      item = Item.new(condition_id: 1)
      item.valid?
      expect(item.errors.full_messages).to include('Condition must be other than 1')
    end
  end
end
