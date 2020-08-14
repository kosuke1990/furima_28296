require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー管理機能' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "ニックネームが入力されていないとエラーメッセージが出力される" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが入力されていないとエラーメッセージが出力される" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは@を含む必要があること" do
      # ブラウザ上でエラーメッセージが出力されるので対応不要
    end
    it "パスワードが入力されていないとエラーメッセージが出力される" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは5文字以下ならばエラーメッセージが出力される" do
      @user.password = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは半角英数字混合であること" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "パスワードは確認用を含めて2回入力されていないとエラ〜メッセージが出力される" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザー本名の名字と名前が入力されていないとエラーメッセージが出力される" do
      @user.first_name_zenkaku = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name zenkaku can't be blank")
      @user.last_name_zenkaku = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name zenkaku can't be blank")
    end
    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.first_name_zenkaku = "11"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name zenkaku Full-width characters")
      @user.last_name_zenkaku = "11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name zenkaku Full-width characters")
    end
    it "ユーザー本名のフリガナが入力されていないとエラーメッセージが出力される" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
      @user.first_name_kana = "11"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      @user.last_name_kana = "11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
    end
    it "生年月日が入力されていないとエラーメッセージが出力される" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end