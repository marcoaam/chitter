module SessionHelper

  def sign_up(username = 'marcoaam', name = 'Marco', email = 'marco@gmail.com', password = 'azul', password_confirmation = 'azul')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username, :with => username
    fill_in :name, :with => name
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button 'Sign up'
  end

  def sign_in(name, password)
    visit '/session/new'
    expect(page.status_code).to eq(200)
    fill_in :username, :with => name
    fill_in :password, :with => password
    click_button('Log in')
  end
  
end