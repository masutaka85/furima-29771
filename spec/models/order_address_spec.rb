require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '全ての情報が存在すれば購入できる' do
        expect(@order).to be_valid
      end
      it 'post_numberが数字3桁+ハイフン+数字4桁なら購入できる' do
        @order.post_number = '000-0000'
        expect(@order).to be_valid
      end
      it 'phone_numberが11桁以内なら購入できる' do
        @order.phone_number = '09011112222'
        expect(@order).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end
    context '商品が購入できない時' do
      it 'post_numberが空では購入できない' do
        @order.post_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number can't be blank")
      end
      it 'prefectures_idが1では購入できない' do
        @order.prefectures_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefectures must be greater than 1')
      end
      it 'cityが空では購入できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では購入できない' do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_numberにハイフンがないと購入できない' do
        @order.post_number = '00000000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post number is invalid')
      end
      it 'post_numberが9桁以上だと購入できない' do
        @order.post_number = '000-00000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post number is too long (maximum is 8 characters)')
      end
      it 'post_numberが半角数字でないと購入できない' do
        @order.post_number = 'aaa-ああああ'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post number is invalid')
      end
      it 'phone_numberが12桁以上では購入できない' do
        @order.phone_number = '090111122223'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid', 'Phone number is too long (maximum is 11 characters)')
      end
      it 'phone_numberが半角数字でないと購入できない' do
        @order.phone_number = 'aaaああああアアアア'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
