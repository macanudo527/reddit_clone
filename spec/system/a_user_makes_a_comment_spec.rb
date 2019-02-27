require "rails_helper"

RSpec.describe "Make a Comment", js: true do
	it 'saves a comment to a link' do
		user = create(:user)
		login_as(user)
		link = create(:link)
		visit link_path(link)
		body_text = "stuff"
		fill_in "comment_body", with: body_text
		click_on "Add Comment"
		expect(page).to have_content(body_text)
		expect(page).to have_button("Add Comment")
	end
end