class Event < ApplicationRecord
	has_many :platform
	has_many :user, :through => :platform
end
