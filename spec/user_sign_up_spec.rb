feature 'Signing up' do
  scenario 'A user can sign up by filling in a form' do
    visit('/honks')
    click_link('Sign Up')
    expect(current_path).to eq("/users/sign_up")
    fill_in('name', with: "Ben")
    fill_in('username', with: "BenRoss92")
    fill_in('email', with: "ben@123.com")
    fill_in('password', with: "password")
    fill_in('password_confirmation', with: "password")
    expect{click_button('Sign Up')}.to change(User, :count).by(1)
    expect(User.first.email).to eq('ben@123.com')
    expect(current_path).to eq('/honks')
    expect(page).to have_content('Welcome Ben!')
  end

  scenario 'A generic welcome message is shown to user not signed up' do
    visit('/honks')
    expect(page).to have_content('Welcome to Honk!')
  end

  scenario "A user is not created when passwords don't match" do
    visit('/honks')
    click_link('Sign Up')
    expect(current_path).to eq("/users/sign_up")
    fill_in('name', with: "Ben")
    fill_in('username', with: "BenRoss92")
    fill_in('email', with: "ben@123.com")
    fill_in('password', with: "password1")
    fill_in('password_confirmation', with: "password")
    expect{click_button('Sign Up')}.not_to change(User, :count)
    expect(current_path).to eq("/users")
    expect(page).to have_content("Password and Password Confirmation don't match")
  end

end
