require "rails_helper"

RSpec.describe "User voting", js: true do # Rails 5 uses describe, Rails < 5 feature
	it "updates the downvote count" do
		user = create(:user)
		login_as(user)
		link = create(:link)
		visit root_path
		expect(page).to have_css('#upvotes-1', text: '0')
		click_on(id: 'upvoter-1')		
		expect(page).to have_css('#upvotes-1', text: '1')
	end
end