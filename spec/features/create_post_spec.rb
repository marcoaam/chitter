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

	scenario 'Can create a text post' do
		visit '/'
		expect(page).not_to have_content('Text post')
		sign_in('marcoaam', 'test')
		click_link('Text post')
		fill_in :post_text, with: 'I love coding!!'
		click_button('Post')
		expect(page).to have_content('I love coding!! Posted by @marcoaam')
	end

	scenario 'Can create a image post' do
		visit '/'
		expect(page).not_to have_content('Picture post')
		sign_in('marcoaam', 'test')
		click_link('Picture post')
		attach_file('myfile', 'app/public/images/marco.jpg')
		click_button("Upload!")
		fill_in :post_text, with: 'I love coding!!'
		click_button('Post')
		expect(Post.first.picture).to eq ('marco.jpg')
		expect(page).to have_content('The file was successfully uploaded')
		expect(page).to have_content('I love coding!! Posted by @marcoaam')
	end

end