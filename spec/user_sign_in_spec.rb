feature 'User signs in' do

  let!(:user) do
    User.create(name: 'Ben', email: 'ben@123.com',
                password: 'correct_password',
                password_confirmation: 'correct_password')
  end

  scenario 'with correct credentials' do
    visit('/honks')
    click_link('Sign In')
    expect(current_path).to eq('/users/sign_in')
    fill_in('email', with: 'ben@123.com')
    fill_in('password', with: 'correct_password')
    click_button('Sign In')
    expect(current_path).to eq('/honks')
    expect(page).to have_content('Welcome Ben!')
  end

  scenario 'with incorrect credentials' do
    visit('/honks')
    click_link('Sign In')
    expect(current_path).to eq('/users/sign_in')
    fill_in('email', with: "rand@rand.com")
    fill_in('password', with: "password")
    click_button('Sign In')
    expect(current_path).to eq('/sessions')
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Email or password incorrect')
  end
end
