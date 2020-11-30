class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :boards
	has_many :webtoons, :through => :boards
	has_many :platform
	has_many :event, :through => :platform
end
