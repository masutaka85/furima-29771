class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :prefectures_id, :city, :house_number, :building_name, :phone_number, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}-\d{4}\z/ }, length: { maximum: 8 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A0\d{9,10}\z/ }, length: { maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefectures_id, numericality: { greater_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefectures_id: prefectures_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
