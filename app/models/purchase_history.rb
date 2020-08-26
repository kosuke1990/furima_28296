class PurchaseHistory < ApplicationRecord
  has_one :trade, class_name:"Transaction", dependent: :destroy
  belongs_to :user
  belongs_to :item
end
