class TransactionsController < ApplicationController
  before_action :set_active_hash, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :set_transaction, only: [:create]

  def index
    @address = PurchaseHistory.new
    @transaction  = PurchaseAddress.new
  end

  def create
    if @transaction.valid?
      @transaction.save(current_user.id, params[:item_id])
      return redirect_to root_path
    else
      render :index
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: transaction_params[:price],  # 商品の値段
      card: transaction_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
  
  private
  def address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number)
  end

  def set_active_hash
    @prefecture = WhereDeliveryFrom.all.order('id ASC')
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_transaction
    @transaction = PurchaseAddress.new(address_params)
  end
end