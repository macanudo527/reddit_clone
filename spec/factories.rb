FactoryBot.define do

factory :user do
	sequence(:email) { |n| "test#{n}@example.com" }
	password { 'password' }
	password_confirmation { 'password' }
end

factory :link do 
	title { 'example' } 
	url { 'http://example.com' }
	user 
end

factory :vote do
	vote { 1 }
	user
	link
end



end