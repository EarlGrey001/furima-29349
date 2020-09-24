class ItemDonation

  include ActiveModel::Model
  attr_accessor :item_id, :postal_code, :area_id, :city,:address, :phone_number, :building,:token,:user_id


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d+\z/}, length: { maximum:11 }
  end

  validates :area_id, numericality: { other_than: 1 }





  def save
    # 商品の情報を保存し、「item」という変数に入れている
    order = Order.create(user_id: user_id,item_id: item_id)
    
    Address.create(postal_code: postal_code, area_id: area_id, city: city,address: address, phone_number: phone_number, building: building,order_id: order.user_id)
  end
end