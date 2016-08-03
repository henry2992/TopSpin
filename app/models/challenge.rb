class Challenge < ActiveRecord::Base

	belongs_to :level

	# Validations
	validates :name, presence: true
	validates :description, presence: true
	validates :points, presence: true, numericality: { only_integer: true }

end
