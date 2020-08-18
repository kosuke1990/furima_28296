class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  with_options presence: true do
    validates :name, presence: true
    validates :explanation, presence: true
    validates :price, presence: true, numericality: {less_than: 10000000, greater_than: 300}
    #ジャンルの選択が「--」の時は保存できないようにする
    validates :category_id, :status_id, :who_cover_fee_id, :where_delivery_from_id, :how_long_id, numericality: { other_than: 1 } 
  end
end
