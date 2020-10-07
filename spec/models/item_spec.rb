require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it '全ての情報が存在していれば出品できる' do
        expect(@item).to be_valid
      end
      it 'nameが40字以下なら出品できる' do
        @item.name = Faker::Lorem.characters(number: 40)
        expect(@item).to be_valid
      end
      it 'textが1000字以下なら出品できる' do
        @item.text = Faker::Lorem.characters(number: 1000)
        expect(@item).to be_valid
      end
      it 'priceが300~9,999,999なら出品できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと出品できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be greater than 1')
      end
      it 'status_idが1だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be greater than 1')
      end
      it 'shipping_charges_idが1だと出品できない' do
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charges must be greater than 1')
      end
      it 'shipping_prefectures_idが1だと出品できない' do
        @item.shipping_prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping prefectures must be greater than 1')
      end
      it 'days_to_ship_idが1だと出品できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be greater than 1')
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number', 'Price is invalid')
      end
      it 'nameが41字以上だと出品できない' do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'textが1001字以上だと出品できない' do
        @item.text = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Text is too long (maximum is 1000 characters)')
      end
      it 'priceが299以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10,000,000以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
