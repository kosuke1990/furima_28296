class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :where_delivery_from
  belongs_to :purchase_history
end
