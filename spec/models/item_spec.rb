require 'rails_helper'

RSpec.describe Item, type: :model do
  describe ' 商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/item-sample.png')
    end
    context '新規投稿商品がうまくいくとき' do
      it 'ログインしているユーザーが出品ページへ遷移できること' do
      end
      it 'ログインしていないユーザーは出品ページへ遷移できないこと' do
      end
      it '新規商品投稿に必須事項を入力したら新規商品を投稿できること' do
      end
      it '新規商品投稿のpriceが300円で新規商品を投稿できること' do
      end
      it '新規商品投稿のpriceが9999999円で新規商品を投稿できること' do
      end
    end
    context '新規投稿商品がうまくいかない時' do
      it '商品名がない時にエラーメッセージが出力されること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がない時にエラーメッセージが出力されること' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報がない時にエラーメッセージが出力されること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報がない時にエラーメッセージが出力されること' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担についての情報がない時にエラーメッセージが出力されること' do
        @item.who_cover_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Who cover fee can't be blank")
      end
      it '発送元の地域についての情報がない時にエラーメッセージが出力されること' do
        @item.where_delivery_from_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Where delivery from can't be blank")
      end
      it '発送までの日数についての情報がない時にエラーメッセージが出力されること' do
        @item.how_long_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("How long can't be blank")
      end
      it '価格についての情報がない時にエラーメッセージが出力されること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格情報がprice<300||price>9999999の時にエラーが出力されること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
    end
  end
end
