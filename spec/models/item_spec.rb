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
    end
    context '新規投稿商品がうまくいかない時' do
      it '商品名がない時にエラーメッセージが出力されること' do
      end
      it '商品の説明がない時にエラーメッセージが出力されること' do
      end
      it 'カテゴリーの情報がない時にエラーメッセージが出力されること' do
      end
      it '商品の状態についての情報がない時にエラーメッセージが出力されること' do
      end
      it '配送料の負担についての情報がない時にエラーメッセージが出力されること' do
      end
      it '発送元の地域についての情報がない時にエラーメッセージが出力されること' do
      end
      it '発送までの日数についての情報がない時にエラーメッセージが出力されること' do
      end
      it '価格についての情報がない時にエラーメッセージが出力されること' do
        @item.price = ''
        @item.valid?
        
        binding.pry
        
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格情報がprice<300||price>9999999の時にエラーが出力されること' do
      end
    end
  end
end
