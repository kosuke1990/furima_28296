class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase_histories

  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-zA-Z\d]{6,}+\z/i.freeze
    ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
    KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :password, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' }
    validates :nickname, presence: true, uniqueness: { case_sensitive: true }
    validates :email, presence: true
    validates :first_name_zenkaku, presence: true, format: { with: ZENKAKU_REGEX, message: 'Full-width characters' }
    validates :last_name_zenkaku, presence: true, format: { with: ZENKAKU_REGEX, message: 'Full-width characters' }
    validates :first_name_kana, presence: true, format: { with: KANA_REGEX, message: 'Full-width katakana characters' }
    validates :last_name_kana, presence: true, format: { with: KANA_REGEX, message: 'Full-width katakana characters' }
    validates :birthday, presence: true
  end
end
