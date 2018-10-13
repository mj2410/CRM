class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def active_for_authentication? 
    super && (user_type == 2 or user_type == 1) 
  end 
  
  def inactive_message 
    user_type == 2 ? super : :not_approved
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    user_type == 1
  end

  def agent?
    user_type == 2
  end
end
