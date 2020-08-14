class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i, message: "Include both letters and numbers"}
    validates :nickname, presence: true
    validates :email, presence: true
    validates :first_name_zenkaku, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :last_name_zenkaku, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :birthday, presence: true
  end
end