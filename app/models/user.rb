class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :family_name, presence: true
  validates_format_of :family_name, with: /\A[ぁ-んァ-ン一-龥]+\z/
  validates :first_name, presence: true
  validates_format_of :family_name_kana, with: /\A[ァ-ン]+\z/
  validates :family_name_kana, presence: true
  validates_format_of :first_name, with: /\A[ぁ-んァ-ン一-龥]+\z/
  validates :first_name_kana, presence: true
  validates_format_of :first_name_kana, with: /\A[ァ-ン]+\z/
  validates :birthday, presence: true
end
