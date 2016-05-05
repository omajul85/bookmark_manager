require 'spec_helper'

feature 'Signing up' do
	scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, omar@example.com')
    expect(User.first.email).to eq('omar@example.com')
  end
end