class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true, length: { maximum: 6 }
  validates :email, presence: true, uniqueness: true, inclusion: { in: "@" }
  validates :password, presence: true, length: { maximum: 6 }
  validates :password_confirmation, presence: true, length: { maximum: 6 }
  validates :family_name, presence: true, length: { maximum: 6 }
  validates :first_name, presence: true, length: { maximum: 6 }
  validates :family_name_kana, presence: true, length: { maximum: 6 }
  validates :first_name_kana, presence: true, length: { maximum: 6 }
  validates :birthday, presence: true
end
