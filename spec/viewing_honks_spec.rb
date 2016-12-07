feature 'Viewing links' do
  scenario 'I can see existing honks on the honks page' do
    Honk.create(message:"HI, I'M AMAZING!", posted_at: Time.new(2016,11,29,13,20))
    visit('/honks')
    expect(page.status_code).to eq(200)
    within("ul#honks") do
      expect(page).to have_content("HI, I'M AMAZING!")
    end
  end
end
