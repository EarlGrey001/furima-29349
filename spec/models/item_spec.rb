require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品' do
    context '新規登録がうまくいくとき' do
      it "必要な情報が全て存在すれば出品できる" do
        expect(@item).to be_valid
      end
      it "販売価格が¥300~¥9,999,999以内の半角数字であれば出品できる" do
        @item.price = 600
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nameが空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "commentが空では登録できない" do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it "shipping_cost_idが空では登録できない" do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it "shipping_state_idが空では登録できない" do
        @item.shipping_state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping state can't be blank")
      end
      it "shipping_origin_idが空では登録できない" do
        @item.shipping_origin_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end
      it "category_idが空では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "priceが299以下では登録できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが10,000,000以上では登録できない" do
        @item.price = '111111111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
