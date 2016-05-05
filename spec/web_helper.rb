def sign_up_correct_password
	visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'omar@example.com'
  fill_in :password, with: 'azerty'
  fill_in :password_confirmation, with: 'azerty'
  click_button 'Sign Up'
end

def sign_up_incorrect_password
	visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'omar@example.com'
  fill_in :password, with: 'azerty'
  fill_in :password_confirmation, with: '123456'
  click_button 'Sign Up'
end