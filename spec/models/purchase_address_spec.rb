require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能' do
    before do
      @transaction = FactoryBot.build(:purchase_address)
    end
    context '商品購入がうまくいく時' do
      it '建物名がブランクでも購入できること' do
        @transaction.building = ""
        expect(@transaction).to be_valid
      end
      it '住所がブランクでも購入できること' do
        expect(@transaction).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it '郵便番号が空だと保存できないこと' do
        @transaction.postal_code = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @transaction.prefecture_id = 1
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Prefecture Select")
      end
      it '市区町村が空だと保存できないこと' do
        @transaction.city = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @transaction.address = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @transaction.phone_number = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号にハイフンがないとエラーが出力されること' do
        @transaction.postal_code = 1231234
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Postal code Input correctly")
      end
    end
  end
end