class OrdersController < ApplicationController
  before_action :order_item, only: [:index, :create]

  def index
    @order = Order.new

    return redirect_to root_path if user_signed_in? && current_user.id == @item.user_id

    return redirect_to root_path unless @item.order.nil?
  end

  def create
    @order = ItemDonation.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:item_id, :postal_code, :area_id, :city, :building, :address, :phone_number, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end
end
