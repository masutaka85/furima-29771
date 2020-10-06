class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_prefecture
  belongs_to_active_hash :days_to_ship

  has_one_attached :image

  belongs_to :user
  
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
      with_options numericality: { greater_than: 1 } do
        validates :category_id
        validates :status_id
        validates :shipping_charges_id
        validates :shipping_prefectures_id
        validates :days_to_ship_id
      end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: {with: /\A[0-9]+\z/}
  end
end
