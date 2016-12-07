feature 'Creating honks' do
  scenario 'I can create a honk by filling in a form' do
    visit('/honks/new')
    fill_in('message', with: "Just made toast. Stay Tuned.")
    click_button('Honk!')
    expect(current_path).to eq("/honks")
    within("ul#honks") do
      expect(page).to have_content("JUST MADE TOAST. STAY TUNED.")
    end
  end
end
