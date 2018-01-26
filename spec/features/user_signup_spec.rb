feature 'user signup' do
  scenario 'a user can signup to the bookmark manager' do
    visit '/signup'
    fill_in 'email', with: 'someone@google.com'
    fill_in 'password', with: 'secret'
    click_button 'Register'
    expect(page).to have_content 'Bookmark Manager'
    expect(page).to have_content 'Welcome someone@google.com'
  end
end

=begin
Checks that the User count increases by 1.
=end
