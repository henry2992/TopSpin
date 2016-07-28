require 'test_helper'
require 'devise'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  	include Devise::TestHelpers


  	
  	def setup
  		@request.env["devise.mapping"] = Devise.mappings[:player]
	    @player = User.create(email: "example@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
	end

	test "player should be valid" do
	    assert player.valid?, "Player is not valid"
	end

 #  	test "should not save player without email" do
	#   player = Player.new
	#   assert_not player.save, "Saved the player without an email"
	# end
end
