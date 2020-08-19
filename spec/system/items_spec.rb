require 'rails_helper'

RSpec.describe '商品出品機能実装', type: :system do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  def visit_with_http_auth(path)
    username = 'admin'
    password = '2222'
    visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
  end
  
  it 'ログインしていないユーザーは"新規投稿商品"をクリックするとサインイン画面に遷移する' do
    # ベーシック認証
    visit_with_http_auth root_path
    # トップページに移動する
    visit root_path
    # 新規投稿商品をクリックするとサイン画面に遷移する
    click_on("新規投稿商品")
    # expect(current_path).to eq new_user_session_path
    expect(page).to have_current_path new_user_session_path

  end
  it 'ログインしているユーザーは"新規投稿商品"をクリックすると商品投稿画面に遷移する' do
    # ベーシック認証
    visit_with_http_auth root_path
    # トップページに移動する
    visit root_path
    # ログインするとトップページに遷移する
    click_on("新規登録")
    expect(page).to have_current_path new_user_registration_path
    fill_in 'nickname', with: @user.nickname
    fill_in 'email', with: @user.email
    fill_in 'password', with: '111aaa'
    fill_in 'password-confirmation', with: '111aaa'
    fill_in 'first-name', with: @user.first_name_zenkaku
    fill_in 'last-name', with: @user.last_name_zenkaku
    fill_in 'first-name-kana', with: @user.first_name_kana
    fill_in 'last-name-kana', with: @user.last_name_kana
    select '2000', from: "user[birthday(1i)]"
    select '11', from: "user[birthday(2i)]"
    select '11', from: "user[birthday(3i)]"
    click_on("会員登録")
    expect(page).to have_current_path root_path
    
    # binding.pry
    
    # 新規投稿商品をクリックすると商品投稿画面に遷移する

    click_on("新規投稿商品")
    expect(page).to have_current_path new_item_path
  end
end