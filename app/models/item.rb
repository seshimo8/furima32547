class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :Shipping_charge
  belongs_to :prefecture
  belongs_to :day_to_ship

  validates :title, :text, presence: true

  validates :genre_id, numericality: { other_than: 1 } 


end
