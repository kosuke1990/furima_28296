class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new]

  def index
  end

  def new
    @item = Item.new
    @categories = Category.order("id ASC")
    @statuses = Status.order("id ASC")
    @who_cover_fee = WhoCoverFee.order("id ASC")
    @where_delivery_from = WhereDeliveryFrom.order("id ASC")
    @how_long = HowLong.order("id ASC")
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
