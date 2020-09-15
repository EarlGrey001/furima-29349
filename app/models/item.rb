class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :price, presence: true
  validates_format_of :price, with: /\A\d+\z/
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}


  private

  def item_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  validates :title, :text, :genre, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

  belongs_to_active_hash :state
  validates :title, :text, :genre, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

  belongs_to_active_hash :cost
  validates :title, :text, :genre, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

  belongs_to_active_hash :area
  validates :title, :text, :genre, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

  belongs_to_active_hash :day
  validates :title, :text, :genre, presence: true
  validates :genre_id, numericality: { other_than: 1 } 
 
end
