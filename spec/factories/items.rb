FactoryBot.define do
  factory :item do
    name                     { 'あああ' }
    text                     { 'あああ' }
    category_id              { 2 }
    status_id                { 2 }
    shipping_charges_id      { 2 }
    prefectures_id           { 2 }
    days_to_ship_id          { 2 }
    price                    { 1000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
