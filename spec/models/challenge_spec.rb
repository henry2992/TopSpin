require 'rails_helper'
require 'challenge'
require 'pp'

RSpec.describe Challenge do 

	# Clean DB To test Associations
	DatabaseCleaner.strategy = :truncation
	DatabaseCleaner.clean


	let(:challenge) { FactoryGirl.create(:challenge) } 
	subject { challenge }

	it 'should not be valid without a name' do
	    challenge.name = nil
	    expect(challenge).to be_invalid
	end

	it 'should not be valid without a description' do
	    challenge.description = nil
	    expect(challenge).to be_invalid
	end

	it 'should not be valid without a points' do
	    challenge.points = nil
	    expect(challenge).to be_invalid
	end

	it 'should not be valid if points are integer' do
	    challenge.points = 'hello'
	    expect(challenge).to be_invalid
	end

	it 'should not be valid if points are double' do
	    challenge.points = 20.34
	    expect(challenge).to be_invalid
	end

	it 'should be valid only with integer' do
	    expect(challenge).to be_valid
	end

	# Associations 
	it "belongs to level" do
	    assc = described_class.reflect_on_association(:level)
	    expect(assc.macro).to eq :belongs_to
	end
    

	it "has level" do 
		expect(challenge.level).to_not be_nil
		expect(challenge.level.name).to eq 'pro'
	end
  

end