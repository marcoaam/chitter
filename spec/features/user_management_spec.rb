require 'spec_helper'

feature 'When browsing the home page' do
	
	scenario 'User can sign up' do
		sign_up('marcoaam', 'Marco', 'marco@gmail.com', 'azul', 'azul')
		expect(User.count).to eq 1  
    expect(page).to have_content("Welcome, Marco")
    expect(User.first.email).to eq("marco@gmail.com") 
	end

end

feature 'When browsing the home page' do

	before(:each) do
		sign_up('marco33', 'marco', 'marco@gmail.com', 'correct_password', 'correct_password')
	end

	scenario 'Can sign in with correct details' do
		sign_in('marco', 'correct_password')
		expect(page).to have_content('Welcome, marco')
	end
end