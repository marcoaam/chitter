require 'spec_helper'
require_relative '../helpers/session'

include SessionHelper

feature 'When user browsing the home page' do

	before(:each) do
		User.create(:username 							=> 'marco33', 
								:name								 	  => 'marco',
								:email 									=> 'marco@gmail.com',
                :password 							=> 'test', 
   							:password_confirmation 	=> 'test')
	end

	scenario 'Can sign in with correct details' do
		sign_in('marco33', 'test')
		expect(page).to have_content('Welcome, marco')
	end

	scenario 'Can not sign in with incorrect details' do
		sign_in('marco33', 'wrong_password')
		expect(page).to have_content('Incorrect log in details please try again')
	end

end