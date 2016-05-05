require 'spec_helper'

feature 'User sign up' do
  scenario 'requires a matching confirmation password' do
    expect { sign_up_incorrect_password }.not_to change(User, :count)
  end
end