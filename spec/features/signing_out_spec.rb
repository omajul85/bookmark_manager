require 'spec_helper'

feature 'Signing out' do
	before(:each) do
    User.create(email: 'foo@bar.com',
                password: 'foobar',
                password_confirmation: 'foobar')
  end

  scenario 'user can sign out while being signed in' do
    sign_in(email: 'foo@bar.com',   password: 'foobar')
    click_button 'Sign Out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, foo@bar.com')    
  end

end