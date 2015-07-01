class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :pizzeria
	validates :rating, presence: true
    validates :comment, presence: true
end
