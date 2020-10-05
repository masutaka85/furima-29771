class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_prefecture
  belongs_to_active_hash :days_to_ship

  belongs_to :user
  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :shipping_charges_id
    validates :shipping_prefectures_id
    validates :days_to_ship_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
end
