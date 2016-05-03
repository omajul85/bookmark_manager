require 'spec_helper'

feature 'View links on page' do
  scenario 'See links on homepage' do
    Link.create(:url => 'http://www.google.com', :title => 'Google')
    visit '/links'

    expect(page.status_code).to eq 200
    
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end