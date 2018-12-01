class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: :true, uniqueness: { case_sensitive: false }

  has_one :profile, dependent: :destroy
  has_many :venues, foreign_key: :owner_id
end
