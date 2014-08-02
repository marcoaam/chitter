require 'spec_helper'
require_relative '../helpers/session'

include SessionHelper

feature 'When user browsing the home page' do
	
	scenario 'User can sign up' do
		sign_up('marcoaam', 'Marco', 'marco@gmail.com', 'azul', 'azul')
		expect(User.count).to eq 1  
    expect(page).to have_content("Welcome, Marco")
    expect(User.first.email).to eq("marco@gmail.com") 
	end

	scenario 'User can not sign up with a already taken username' do
		sign_up('marcoaam', 'Marco', 'marco@gmail.com', 'azul', 'azul')
		sign_up('marcoaam', 'ramon', 'ramon@gmail.com', 'azul', 'azul')
		expect(page).to have_content 'Username is already taken'
	end

	scenario 'User can not sign up with a already taken email' do
		sign_up('luis', 'luis', 'marco@gmail.com', 'azul', 'azul')
		sign_up('pedro', 'pedro', 'marco@gmail.com', 'azul', 'azul')
		expect(page).to have_content 'Email is already taken'
	end

end