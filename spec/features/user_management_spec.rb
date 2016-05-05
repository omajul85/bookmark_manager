require 'spec_helper'

feature 'User sign up' do
  scenario 'requires a matching confirmation password' do
    expect { sign_up_incorrect_password }.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
	  expect { sign_up_incorrect_password }.not_to change(User, :count)
	  expect(current_path).to eq('/users')
	  expect(page).to have_content 'Password and confirmation password do not match'
	end
end