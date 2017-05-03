feature 'Saves a website' do
  scenario 'Adds a bookmark to the manager' do
    visit '/links/new'
    fill_in 'title', with: 'Zombo'
    fill_in 'url', with: 'http//:www.zombo.com'
    click_button 'Add bookmark'

    expect(current_path).to eq '/links'

    within 'ul#list' do
      expect(page).to have_content('This is Zombocom')
    end
  end
end
