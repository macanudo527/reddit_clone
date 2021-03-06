require "rails_helper"

RSpec.describe "Link Submission" do
	it "shows you new page after submitting link" do
		user = create(:user)
		login_as(user)
		link_title = "This Testing Rails book is awesome!"
		link_url = "http://testingrailsbook.com"
		visit root_path
		click_on "Submit Link"
		fill_in "link_title", with: link_title
		fill_in "link_url", with: link_url
		click_on "Submit"
		expect(page).to have_link link_title, href: link_url
	end
end