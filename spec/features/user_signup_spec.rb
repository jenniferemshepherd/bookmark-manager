feature 'user signup' do

  scenario 'a user can signup to the bookmark manager' do
    sign_in_correctly
    expect(page).to have_content 'Bookmark Manager'
    expect(page).to have_content 'Welcome someone@google.com'
  end

  scenario 'user count increases by 1' do
    expect{ sign_in_correctly }.to change{ User.all.size }.by(1)
  end

  scenario 'incorrect confirmation password' do
    expect{ sign_in_incorrectly }.to change{ User.all.size }.by(0)
    expect(page).to have_content('Signup')
    expect(current_path).to eq('/user/new')
    expect(page).to have_content('Password and confirmation password do not match')
  end
end
