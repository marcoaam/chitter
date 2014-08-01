require 'spec_helper'

feature 'When browsing the home page' do
	
	scenario 'User can sign up' do
		lambda { sign_up }.should change(User, :count).by(1)    
    expect(page).to have_content("Welcome, Marco")
    expect(User.first.email).to eq("marco@gmail.com") 
	end

	def sign_up(username = "marcoaam", name = "Marco", email = "marco@gmail.com", password = "azul", password_confirmation = "azul")
    visit '/users/new'
    expect(page.status_code).to eq(200)
	  fill_in :username, :with => username
    fill_in :name, :with => name
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end

end