class Challenge < ActiveRecord::Base

	belongs_to :level

	scope :has_level, -> (id) { where("level_id like ?", "#{id}%")}

	# Validations
	validates :name, presence: true
	validates :description, presence: true
	validates :points, presence: true, numericality: { only_integer: true }

end
