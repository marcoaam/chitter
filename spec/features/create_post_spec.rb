require 'spec_helper'
require_relative './helpers/session'

include SessionHelper

feature 'When user is signed in' do

	before(:each) do
	User.create(:username 							=> 'marcoaam',
							:name 									=> 'Marco',
							:email 									=> 'marco@gmail.com',
							:password 							=> 'test',
							:password_confirmation 	=> 'test')
	end

	scenario 'Can create a post' do
		visit '/'
		expect(page).not_to have_content('Create post')
		sign_in('marcoaam', 'test')
		click_link('Create post')
		fill_in :post_text, with: 'I love coding!!'
		click_button('Post')
		expect(page).to have_content('I love coding!! Posted by @marcoaam')
	end

end