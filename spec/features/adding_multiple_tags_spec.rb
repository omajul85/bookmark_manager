require 'spec_helper'

feature 'Adding multiple tags' do
	scenario 'I can add multiple tags to a new link' do
		visit '/links/new'
		
		fill_in :title, with: 'SOLID'
		fill_in :url,   with: 'http://www.codemag.com/article/1001061'
		fill_in :tags,  with: 'education programming'
		
		click_button 'Add Bookmark'
		link = Link.first
		expect(link.tags.map(&:name)).to include('education', 'programming')
	end
end