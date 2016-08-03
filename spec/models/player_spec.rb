require 'rails_helper'



RSpec.describe Player, type: :model do
  

  before :each do
    @player = FactoryGirl.create(:player)
  end

  it 'should not be valid without an email' do
    @player.email =  nil
    expect(@player).to be_invalid
  end

  it "should be not be valid with password less than 8" do
  	@player.password = '1234567'
  	expect(@player).to be_invalid
  end

  it "it should not be valid if passwords do not match" do 
  	@player.password = '1234567'
  	@player.password_confirmation = '1234568'
  	expect(@player).to be_invalid
  end

  it "it should not be valid without a first name" do 
  	@player.first_name = nil
  	expect(@player).to be_invalid
  end

  it "it should not be valid without a last name" do 
  	@player.last_name = nil
  	expect(@player).to be_invalid
  end

  it "it should start points at 0" do 
  	expect(@player.points).to be 0
  end

end