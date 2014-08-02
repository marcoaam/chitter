require 'spec_helper'
require_relative '../helpers/session'

include SessionHelper

feature 'When user browsing the home page and is logged in' do

	before(:each) do
		User.create(:username 							=> 'marco33', 
								:name 									=> 'marco',
								:email 									=> 'marco@gmail.com',
                :password 							=> 'test', 
                :password_confirmation 	=> 'test')
	end

	scenario 'Can sign out' do
		sign_in('marco33', 'test')
		click_link('Sign out')
		expect(page).to have_content('Good bye!')
		expect(page).not_to have_content('Welcome')
	end
	
end