feature 'Add tag to link' do
  scenario 'Adds a a tag to the link and saves it' do
    visit '/links/new'
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'http://www.bbc.co.uk'
    fill_in 'tag', with: 'News'
    click_button 'Add bookmark'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('News')
    end
  end

  scenario 'Add multiple tags to the link and saves it' do
    visit '/links/new'
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'http://www.bbc.co.uk'
    fill_in 'tag', with: 'News, BBC'
    click_button 'Add bookmark'

    expect(current_path).to eq '/links'
    expect(Link.last.tags.map(&:name)).to include('News', 'BBC')
  end
end
