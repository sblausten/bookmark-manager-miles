 def register 
 	visit '/users/new'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: '1234'
    click_button 'Sign up'
 end