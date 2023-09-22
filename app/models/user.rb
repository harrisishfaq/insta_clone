class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :setting , dependent: :destroy
  has_one_attached :profile_photo, dependent: :destroy
  has_many :friends , dependent: :destroy
  has_many :posts , dependent: :destroy


  has_many :user_like_posts , dependent: :destroy
  has_many :post , through: :user_like_posts

  after_create do
     Setting.create(user_id: self.id) if self.id.present?
  end      

  def full_name
    first_name.present? || last_name.present? ? "#{first_name} #{last_name}" : email
  end
  
end
