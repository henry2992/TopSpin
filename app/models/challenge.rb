class Challenge < ActiveRecord::Base

	belongs_to :level
	has_many :player_challenges
	has_many :steps
	has_one :medal
	
	has_many :player_challenge_progresses

	scope :has_level, -> (id) { where("level_id like ?", "#{id}%")}

	# Validations
	validates :name, presence: true
	validates :description, presence: true
	validates :points, presence: true, numericality: { only_integer: true }

end
