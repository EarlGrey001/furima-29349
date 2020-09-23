class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    # @order = Order.new(price or item_id : order_params[:price or item_id])
    if @order.valid?
      pay_item
      # @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:item_id, :token)
    # ストロングパラメーターにitem_idのキーを設定しましょう
  end

  def pay_item
    Payjp.api_key = "sk_test_78f584725630c8fd97049abf"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      # @itemの中にpriceの情報が入っているので＠itemからpriceを抜き出しましょう
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
