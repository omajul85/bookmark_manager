require 'spec_helper'

feature 'Creating links' do
  scenario 'Add a new link to the DB' do
    visit '/links/new'
    fill_in :title,	with: 'Marca'
    fill_in :url,		with: 'http://www.marca.com/'
    click_button 'Create link'

    expect(current_path).to eq '/./links'

    within 'ul#links' do
      expect(page).to have_content('Marca')
    end
  end
end