class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :post_number
    validates :prefectures_id
    validates :city
    validates :house_number
    validates :phone_number
  end
end
