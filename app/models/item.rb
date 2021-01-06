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

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }

  with_options presence: true, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/, message: '半角数字で入力' } do
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :shipping_charge_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :day_to_ship_id, numericality: { other_than: 1 }
  end
end