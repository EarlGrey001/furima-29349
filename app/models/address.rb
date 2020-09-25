class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options numericality: { other_than: 1 } do
    validates :area_id
  end

  belongs_to_active_hash :area
end
