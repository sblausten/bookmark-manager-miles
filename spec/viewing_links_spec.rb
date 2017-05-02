feature 'viewing list of links' do
  scenario 'I can see existing lins on the links page' do
    Link.create(url: 'http://wwww.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end