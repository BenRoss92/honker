describe User do

  let!(:user) do
    User.create(email: 'ben@123.com',
    password: 'correct_password',
    password_confirmation: 'correct_password')
  end

  it 'authenticates with correct email address & password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq(user)
  end

  it 'does not authenticate with incorrect password' do
    expect(User.authenticate(user.email, 'incorrect_password')).to be_nil
  end

end
