class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tvits
  
  has_many :friendships, foreign_key: 'user_id'
  #has_many :friends, through: :friendships 
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
end
