require 'rails_helper'
require 'challenge'

RSpec.describe Challenge do 

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


end