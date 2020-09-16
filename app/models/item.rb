class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :name, :price, :comment, :image, presence: true
  validates_format_of :price, with: /\A\d+\z/
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}


  private

  def item_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :shipping_cost_id, :shipping_days_id, :shipping_state_id,:shipping_origin_id,:category_id, presence: true

  belongs_to_active_hash :category
  validates :category_id, numericality: { other_than: 1 } 

  belongs_to_active_hash :state
  validates :shipping_state_id, numericality: { other_than: 1 } 

  belongs_to_active_hash :cost
  validates :shipping_cost_id, numericality: { other_than: 1 } 

  belongs_to_active_hash :area
  validates :shipping_origin_id, numericality: { other_than: 1 } 

  belongs_to_active_hash :day
  validates :shipping_days_id, numericality: { other_than: 1 } 
 
end
