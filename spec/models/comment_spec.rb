require 'rails_helper'

RSpec.describe Comment, type: :model do
	before(:each) do
		@link = create(:link)
	end
	it 'ensures body presence' do
		comment = Comment.new(link: @link, user: @user).save
		expect(comment).to eq(false)
	end
	it 'saves with valid parameters' do
		comment = Comment.new(link: @link, user: @user, body: "Example body").save
		expect(comment).to eq(true)
	end
end
