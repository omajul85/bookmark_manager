def sign_up
	visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'omar@example.com'
  fill_in :password, with: 'azerty'
  click_button 'Sign Up'
end