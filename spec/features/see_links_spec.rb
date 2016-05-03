require 'spec_helper'

feature 'View links on page' do
  scenario 'See links on homepage' do
    visit '/'
    Link.create(:url => 'http://www.google.com', :title => 'Google')
    expect(page).to have_content('Google')
  end
end