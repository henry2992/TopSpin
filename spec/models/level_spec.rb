require 'rails_helper'
require 'pp'
require 'database_cleaner'

RSpec.describe Level, type: :model do

	# Clean DB To test Associations
	DatabaseCleaner.strategy = :truncation
	DatabaseCleaner.clean

  	let(:level) { FactoryGirl.create(:level) } 	
	subject { level }

	it 'should not be valid without a name' do
	    level.name = nil
	    expect(level).to be_invalid
	end

	# Test Associations
	
	it "has many challenges" do
	    assc = described_class.reflect_on_association(:challenges)
	    expect(assc.macro).to eq :has_many
	end

	it "has a challenge" do
	    expect(level.challenges).to_not be_nil
	end

	it "should include challenge" do 
		expect(level.challenges).to include(level.challenges[0])
	end


end
