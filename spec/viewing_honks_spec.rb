feature 'Viewing honks' do
  scenario 'I can see existing honks on the honks page' do
    visit('/honks')
    click_link('Sign Up')
    fill_in('name', with: "Ben")
    fill_in('username', with: "BenRoss92")
    fill_in('email', with: "ben@123.com")
    fill_in('password', with: "password")
    fill_in('password_confirmation', with: "password")
    click_button('Sign Up')
    visit('/honks/new')
    fill_in('message', with: "Just made toast. Stay Tuned.")
    click_button('Honk!')
    within("ul#honks") do
      expect(page).to have_content("@BenRoss92: JUST MADE TOAST. STAY TUNED.")
    end
  end
end
