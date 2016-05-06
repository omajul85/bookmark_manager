require 'spec_helper'

feature 'Creating Link' do
  scenario 'user can add a link to database' do
    visit '/links/new'

    fill_in :title, with: 'W3Schools'
    fill_in :url, with: 'http://www.w3schools.com/'
    fill_in :tags,  with: 'education'

    click_button 'Add Bookmark'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')  
  end
end