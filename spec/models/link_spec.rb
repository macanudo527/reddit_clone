require 'rails_helper'

RSpec.describe Link, :type => :model do
	context 'validation tests' do 
		it 'ensures title presence' do
			link = Link.new(url: 'http://www.example.com').save
			expect(link).to eq(false)
		end

		it 'ensures url presence' do
			link = Link.new(title: 'example link').save
			expect(link).to eq(false)
		end

		it 'should save successfully' do
			link = Link.new(title: 'example link', url: 'http://www.example.com', user: @user).save
			expect(link).to eq(true)
		end
	end
	context 'voting system' do
		before(:each) do
			@link = create(:link)
		end

		it 'should increase the vote count when you upvote' do
			expect { @link.upvote(@user) }.to change(@link, :upvotes).by(1) 
		end

		it 'should increase the vote count when you downvote' do
			expect { @link.downvote(@user) }.to change(@link, :downvotes).by(1) 
		end

		it 'should increase total score when you upvote' do
			expect { @link.upvote(@user) }.to change(@link, :total_score).by(1)
		end
		it 'should decrease total score when you downvote' do
			expect { @link.downvote(@user) }.to change(@link, :total_score).by(-1)
		end

	end
	context 'scope tests' do 

	end

end
