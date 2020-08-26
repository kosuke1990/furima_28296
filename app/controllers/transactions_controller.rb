class TransactionsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @transaction = Transaction.new
    @prefecture = WhereDeliveryFrom.all.order('id ASC')
  end

  def create
    @purchase_history = PurchaseHistory.new(purchase_history_params)
    if @purchase_history.valid?
      @purchase_history.save
    end

    @transaction = Transaction.new(transaction_params)
    @item = Item.find(params[:item_id])
    @prefecture = WhereDeliveryFrom.all.order('id ASC')
    
    
    if @transaction.valid?
      pay_item
      @purchase_history.save
      binding.pry
      @transaction.save
      return redirect_to root_path
    else
      render 'index'
    end
    
    binding.pry
    
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    
    binding.pry
    
    Payjp::Charge.create(
      amount: transaction_params[:price],  # 商品の値段
      card: transaction_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
  
  private
  def transaction_params
    params.require(:transaction).permit(:price, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(purchase_history_id: @purchase_history.id)
  end

  def purchase_history_params
    {}.merge(user_id: current_user.id, item_id: params[:item_id]) 
  end
  
end