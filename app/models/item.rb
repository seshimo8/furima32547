class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :day_to_ship

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :day_to_ship_id
    validates :price
    validates :image
  end

  with_options numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 } do
    validates :price, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/, message: '半角数字で入力' }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :day_to_ship_id
  end
end
