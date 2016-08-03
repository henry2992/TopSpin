class Level < ActiveRecord::Base
	has_many :challenges

	# Validations
	validates :name, presence: true

end
