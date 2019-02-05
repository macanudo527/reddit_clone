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
	context 'scope tests' do 

	end

end
