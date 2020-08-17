class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :who_cover_fee, :where_delivery_from_id, :how_long_id, numericality: { other_than: 1 } 

end
