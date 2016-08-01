class Challenge < ActiveRecord::Base

	validates :name, presence: true
	validates :description, presence: true
	validates :points, presence: true, numericality: { only_integer: true }


end
