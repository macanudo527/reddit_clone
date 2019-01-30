FactoryGirl.define do

factory :link do 
	title 'example' 
	url 'http://example.com' 
end

factory :user do
	email 'guy@example.com'
	password 'password'
	password_confirmation 'password'
end

end