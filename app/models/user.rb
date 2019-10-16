class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:member, :staff, :admin]

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :phone, presence: true, format: { with: /\A\d+\z/, message: "Only number"}, length: { in: 10..12 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def name_user
    self.name.titleize
  end
end
