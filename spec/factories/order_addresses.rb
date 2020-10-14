FactoryBot.define do
  factory :order_address do
    post_number     { '111-1111'}
    prefectures_id  { 2 }
    city            {'横浜市緑区'}
    house_number    {'青山1-1-1'}
    building_name   {'神南ビル401'}
    phone_number    {'09012345678'}
    token           { 123_456_789 }
    user_id         { 1 }
    item_id         { 1 }
  end
end
