feature 'Creating honks' do
  scenario 'I can create a honk by filling in a form' do
    visit('/honks')
    click_link('Sign Up')
    fill_in('name', with: "Ben")
    fill_in('username', with: "BenRoss92")
    fill_in('email', with: "ben@123.com")
    fill_in('password', with: "password")
    fill_in('password_confirmation', with: "password")
    click_button('Sign Up')
    expect(current_path).to eq("/honks")
    click_link('Honk Something')
    expect(current_path).to eq("/honks/new")
    fill_in('message', with: "Just made toast. Stay Tuned.")
    click_button('Honk!')
    expect(current_path).to eq("/honks")
    within("div.container") do
      expect(page).to have_content("JUST MADE TOAST. STAY TUNED.")
    end
  end
end
