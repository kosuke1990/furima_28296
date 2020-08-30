class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    POSTALCODE_REGEX = /\A[\d]{3}[-][\d]{4}\z/.freeze
    validates :postal_code, format: { with: POSTALCODE_REGEX, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address
    # validates :building
    validates :phone_number
  end

  def save(user_id, item_id)
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end
