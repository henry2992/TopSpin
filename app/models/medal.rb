class Medal < ActiveRecord::Base

	belongs_to :challenge

	has_many :player_medals


	mount_uploader :picture, PictureUploader
end
