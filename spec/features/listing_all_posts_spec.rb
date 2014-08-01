require 'spec_helper'

feature 'List of all posts' do

	before(:each) do
		Post.create(:post => "Went to Makers Academy today",
								:user => User.create(:username => 'marcoaam',
																		:name => 'Marco',
																		:email => 'marco.army@gmail.com',
																		:password_digest => '1234'
																		)
								)
		Post.create(:post => "Hi all, Coding is awesome",
								:user => User.create(:username => 'luisma',
																		:name => 'Luis',
																		:email => 'luis@gmail.com',
																		:password_digest => '1234'
																		)
								)
	end

	scenario 'When visiting the home page' do
		visit '/'
		expect(page).to have_content('Went to Makers Academy today')
		expect(page).to have_content('@marcoaam')
		expect(page).to have_content('Hi all, Coding is awesome')
		expect(page).to have_content('@luisma')
	end

end

