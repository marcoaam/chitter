require 'spec_helper'

feature 'When user browses the home page' do
	before(:each) do
		Post.create(:post => 'Love coding',
								:user => User.create(:username => 'marcoaam',
																		:name => 'Marco',
																		:email => 'marco.army@gmail.com',
																		:password_digest => '1234'
																		)
								)
		Post.create(:post => 'Hi all, Coding is awesome',
								:user => User.create(:username => 'luisma',
																		:name => 'Luis',
																		:email => 'luis@gmail.com',
																		:password_digest => '1234'
																		)
								)
	end
	scenario 'filters posts by username when click username' do
		visit '/'
		click_link('@marcoaam')
		expect(page).to have_content('Love coding')
		expect(page).not_to have_content('Hi all, Coding is awesome')
	end
end