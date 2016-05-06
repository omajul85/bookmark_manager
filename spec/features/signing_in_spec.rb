require 'spec_helper'

feature 'Signing in' do
	let(:user) do
    User.create(email: 'foo@bar.com',
                password: 'foobar',
                password_confirmation: 'foobar')
  end

  scenario 'user can sign in with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end