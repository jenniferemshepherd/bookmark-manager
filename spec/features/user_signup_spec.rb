feature 'user signup' do
  before do
    visit '/signup'
    fill_in 'email', with: 'someone@google.com'
    fill_in 'password', with: 'secret'
    click_button 'Register'
  end

  scenario 'a user can signup to the bookmark manager' do
    expect(page).to have_content 'Bookmark Manager'
    expect(page).to have_content 'Welcome someone@google.com'
  end

  scenario 'user count increases by 1' do
    expect(User.all.size).to eq 1
  end
end
