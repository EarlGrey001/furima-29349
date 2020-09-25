require 'rails_helper'

RSpec.describe ItemDonation, type: :model do
  describe '購入情報の保存' do
    before do
      @item_donation = FactoryBot.build(:item_donation)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_donation).to be_valid
    end

    it 'tokenが空だと保存できないこと' do
      @item_donation.token = nil
      @item_donation.valid?
      expect(@item_donation.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空だと保存できないこと' do
      @item_donation.user_id = nil
      @item_donation.valid?
      expect(@item_donation.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できないこと' do
      @item_donation.item_id = nil
      @item_donation.valid?
      expect(@item_donation.errors.full_messages).to include("Item can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @item_donation.postal_code = nil
      @item_donation.valid?
      expect(@item_donation.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにhyphen(-)が無いと保存できないこと' do
      @item_donation.postal_code = '3214567'
      @item_donation.valid?
      expect(@item_donation.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'area_idが空だと保存できないこと' do
      @item_donation.area_id = nil
      @item_donation.valid?
      expect(@item_donation.errors.full_messages).to include("Area can't be blank")
    end
    it 'area_idが半角数字でないと保存できないこと' do
      @item_donation.area_id = '東京都'
      @item_donation.valid?
      expect(@item_donation.errors.full_messages).to include('Area is not a number')
    end
    it 'cityが空だと保存できないこと' do
      @item_donation.city = nil
      @item_donation.valid?
      expect(@item_donation.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @item_donation.address = nil
      @item_donation.valid?
      expect(@item_donation.errors.full_messages).to include("Address can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @item_donation.building = nil
      expect(@item_donation).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @item_donation.phone_number = nil
      @item_donation.valid?
      expect(@item_donation.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが半角数字で無いと保存できないこと' do
      @item_donation.phone_number = '1234abcd'
      @item_donation.valid?
      expect(@item_donation.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが12桁以上だと保存できないこと' do
      @item_donation.phone_number = 123_456_789_012
      @item_donation.valid?
      expect(@item_donation.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
    it 'phone_numberの情報に-が含まれていると保存できない' do
      @item_donation.phone_number = 321 - 9876
      @item_donation.valid?
      expect(@item_donation.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
