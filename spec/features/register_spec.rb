feature 'Signup' do
  scenario 'Register name and password' do
    expect { register }.to change { User.count }.by 1
    expect(current_path).to eq '/links'
    expect(page).to have_content('Welcome test@test.com')
    expect(User.first.email).to eq('alice@example.com')
  end
end