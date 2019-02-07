require "rails_helper"

RSpec.feature "User submits a link" do
	scenario "they see the page for the submitted link" do
		user = create(:user)
		login_as(user)
		link = create(:link)
		visit root_path
#		click_on "##{link.url}-up-vote"
#		fill_in "link_title", with: link_title
#		fill_in "link_url", with: link_url
#		click_on "Submit"
#		expect(page).to have_link link_title, href: link_url
	end
end