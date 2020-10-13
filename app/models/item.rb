class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :days_to_ship

  has_one_attached :image

  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    with_options numericality: { greater_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_charges_id
      validates :prefectures_id
      validates :days_to_ship_id
    end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
end
