class User < ApplicationRecord
  has_one :profiles, dependent: :destroy
  belongs_to :property, optional: true
  belongs_to :company, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  def is_admin?
   return true if self.role =="admin"
  end
end
