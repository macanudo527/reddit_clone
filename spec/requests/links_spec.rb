require 'rails_helper'

RSpec.describe "Links", type: :request do
	
	context 'GET #index' do
		it 'returns a success response' do
			get links_url
			expect(response).to be_successful #Rails > 5
#			expect(response).to be_success  # Rails > 5
		end
	end

	context 'GET #show' do
		it 'returns a success response' do
			link = create(:link)
			get link_url(:id => link.id, :user => @user) # Rails > 5
#			get :show, id: link.id # Rails < 5
			expect(response).to be_successful
		end
	end

	context 'GET #new' do
		before(:each) do
			get new_link_url
		end
		it 'renders the new template when user logged in' do
			expect(response).to render_template("new")
		end	
		it "doesn't render the new template when user is not logged in", :logged_out do
			expect(response).not_to render_template("new")
		end 
	end

	context 'GET #create' do
		let(:link_params) { attributes_for(:link, user: @user) }

		it 'creates a link when user logged in' do
			expect { post links_url, :params => { :link => link_params }}.to change(Link, :count).by(1)
		end
		it "doesn't create link when user is logged out", :logged_out do
			expect { post links_url, :params => { :link => link_params }}.not_to change(Link, :count)
		end
	end

	context 'GET #update' do
		before(:each) do
			@link = create(:link)
			link_params = {link: attributes_for(:link, url: "http://anotherexample.com")}
			put link_url(:user => @user, :id => @link.id), :params => link_params
			@link.reload			
		end
		it 'updates the link when user logged in' do
			expect(@link.url).to eq("http://anotherexample.com")
		end
		it "doesn't update the link when user is logged out", :logged_out do
			expect(@link.url).not_to eq("http://anotherexample.com")			
		end
	end

	context 'GET #destroy' do
		before(:each) do
			@link = create(:link)
		end
		it 'destroys a link' do
			expect { delete link_url(:id => @link) }.to change(Link, :count).by(-1)
		end
		it 'redirects to index' do
			delete link_url(:id => @link)
			expect(response).to redirect_to(links_url)
		end
		it "doesn't destroy the link if logged out", :logged_out do
			expect { delete link_url(:id => @link) }.not_to change(Link, :count)			
		end
	end



end