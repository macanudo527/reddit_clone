require 'rails_helper'

RSpec.describe Vote, type: :model do
	context 'validation tests' do 
		before(:each) do
			@link = create(:link)
		end
		it 'ensures vote is not > 1' do
			vote = Vote.new(vote_value: 2, user: @user, link: @link).save
			expect(vote).to eq(false)
		end

		it 'ensures vote is not < -1' do
			vote = Vote.new(vote_value: -2, user: @user, link: @link).save
			expect(vote).to eq(false)
		end

		it 'should save successfully with +1 vote' do
			vote = Vote.new(vote_value: 1, user: @user, link: @link).save
			expect(vote).to eq(true)
		end

		it 'should save successfully with -1 vote' do
			vote = Vote.new(vote_value: -1, user: @user, link: @link).save
			expect(vote).to eq(true)
		end

	end
	context 'scope tests' do 

	end
end
