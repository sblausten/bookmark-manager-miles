feature 'viewing list of links' do
  scenario 'I can see existing links on the links page' do
    #Link.create(url: 'http://wwww.makersacademy.com', title: 'Makers Academy')
    visit '/links'

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
