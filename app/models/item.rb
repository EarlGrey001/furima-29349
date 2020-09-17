class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :name, :price, :comment, :image, presence: true
  validates_format_of :price, with: /\A\d+\z/
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :shipping_cost_id, :shipping_days_id, :shipping_state_id, :shipping_origin_id, :category_id, presence: true

  with_options numericality: { other_than: 1 } do
    validates :shipping_state_id
    validates :category_id
    validates :shipping_cost_id
    validates :shipping_origin_id
    validates :shipping_days_id
  end

  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :cost
  belongs_to_active_hash :area
  belongs_to_active_hash :day
end
