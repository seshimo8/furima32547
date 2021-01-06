class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :day_to_ship

  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :day_to_ship_id, presence: true
  validates :price, presence: true
  validates :image, presence: true

  validates :price,numericality: { only_integer: true,greater_than: 299, less_than: 10000000}

  with_options presence: true, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ ,message: "半角数字で入力" } do
    validates :price
  end

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :day_to_ship_id, numericality: { other_than: 1 } 
end
