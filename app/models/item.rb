class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :purchase_histories
  belongs_to_active_hash :category
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, numericality: { less_than: 10_000_000, greater_than: 299 }
    validates :category_id, :status_id, :who_cover_fee_id, :where_delivery_from_id, :how_long_id, numericality: { other_than: 1, message: 'Select' }
  end
end
