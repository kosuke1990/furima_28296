class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_active_hash, only: [:new, :create, :show]
  def index
    @items = Item.all
    @purchase_history = PurchaseHistory.all
  end

  def new
    @item = Item.new
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @purchase_history = PurchaseHistory.find_by(item_id: params[:id])
  end

  private

  def set_active_hash
    @categories = Category.all.order('id ASC')
    @statuses = Status.all.order('id ASC')
    @who_cover_fee = WhoCoverFee.all.order('id ASC')
    @where_delivery_from = WhereDeliveryFrom.all.order('id ASC')
    @how_long = HowLong.all.order('id ASC')
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :who_cover_fee_id, :where_delivery_from_id, :how_long_id, :price).merge(user_id: current_user.id)
  end
end
