class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :setting
  has_one_attached :profile_photo

  after_create do
     Setting.create(user_id: self.id) if self.id.present?
  end      

end
