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
			link = Link.create!(title: 'example', url: 'http://www.example.com')
			get :show, id: link.id
			expect(response).to be_success
		end
	end



end
