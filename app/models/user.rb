class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, length: { minimum: 6 }
    validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    validates :family_name
    validates_format_of :family_name, with: /\A[ぁ-んァ-ン一-龥]+\z/
    validates :first_name
    validates_format_of :family_name_kana, with: /\A[ァ-ン]+\z/
    validates :family_name_kana
    validates_format_of :first_name, with: /\A[ぁ-んァ-ン一-龥]+\z/
    validates :first_name_kana
    validates_format_of :first_name_kana, with: /\A[ァ-ン]+\z/
    validates :birthday
  end
end
