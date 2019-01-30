require 'rails_helper'

RSpec.describe LinksController, type: :controller do

	
	context 'GET #index' do
		it 'returns a success response' do
			get :index
			expect(response).to be_success
		end
	end

	context 'GET #show' do
		it 'returns a success response' do
			link = create(:link)
			get :show, id: link.id
			expect(response).to be_success
		end
	end

	context 'GET #new' do
		before(:each) do
			get :new
		end
		it 'renders the new template when user logged in' do
			expect(response).to render_template("new")
		end	
		it "doesn't render the new template when user is not logged in", :logged_out do
			expect(response).not_to render_template("new")
		end 
	end

	context 'GET #create' do
		let(:link_params) { attributes_for(:link) }

		it 'creates a link when user logged in' do
			expect { post :create, :link => link_params }.to change(Link, :count).by(1)
		end
		it "doesn't create link when user is logged out", :logged_out do
			expect { post :create, :link => link_params }.not_to change(Link, :count)
		end
	end

	context 'GET #update' do
		before(:each) do
			@link = create(:link)
			put :update, id: @link, link: FactoryGirl.attributes_for(:link, url: "http://anotherexample.com")
			@link.reload			
		end
		it 'updates the link when user logged in' do
			expect(@link.url).to eq("http://anotherexample.com")
		end
		it "doesn't update the link if it doesn't belong to the user" do
			unless @link.user == @user
				expect(@link.url).not_to eq("http://anotherexample.com")
			end
		end	
		it "doesn't update the link when user is logged out", :logged_out do
			expect(@link.url).not_to eq("http://anotherexample.com")			
		end
	end

	context 'GET #destroy' do
		before(:each) do
			@link = FactoryGirl.create(:link)
		end
		it 'destroys a link' do
			expect { delete :destroy, id: @link }.to change(Link, :count).by(-1)
		end
		it 'redirects to index' do
			delete :destroy, id: @link
			expect(response).to redirect_to(links_url)
		end
		it "doesn't destroy the link if it doesn't belong to the user" do
			unless @link.user == @user
				expect { delete :destroy, id: @link }.not_to change(Link, :count)
			end
		end
		it "doesn't destroy the link if logged out", :logged_out do
			expect { delete :destroy, id: @link }.not_to change(Link, :count)			
		end
	end



end
