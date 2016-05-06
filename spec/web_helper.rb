def sign_up(email: 'omar@example.com', password: 'azerty', password_confirmation: 'azerty')
	visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign In'
end