require 'spec_helper'
require_relative './helpers/session'

include SessionHelper

feature 'When user browsing the home page' do
	
	scenario 'User can sign up' do
		sign_up('marcoaam', 'Marco', 'marco@gmail.com', 'azul', 'azul')
		expect(User.count).to eq 1  
    expect(page).to have_content("Welcome, Marco")
    expect(User.first.email).to eq("marco@gmail.com") 
	end

end

feature 'When user browsing the home page' do

	before(:each) do
		User.create(:username => 'marco33', 
								:name => 'marco',
								:email => 'marco@gmail.com',
                :password => 'test', 
                :password_confirmation => 'test')
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

feature 'When user browsing the home page and is logged in' do

	before(:each) do
		User.create(:username => 'marco33', 
								:name => 'marco',
								:email => 'marco@gmail.com',
                :password => 'test', 
                :password_confirmation => 'test')
	end

	scenario 'Can sign out' do
		sign_in('marco33', 'test')
		click_link('Sign out')
		expect(page).to have_content('Good bye!')
		expect(page).not_to have_content('Welcome')
	end
	
end