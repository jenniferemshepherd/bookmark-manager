feature 'Creating favourites' do

  scenario 'I can create a new favourite' do
    visit '/favourites/new'
    fill_in 'url',   with: 'www.google.co.uk'
    fill_in 'title', with: 'Google'
    click_button 'Create favourite'

    expect(current_path).to eq '/favourites'

    within 'ul#favourites' do
      expect(page).to have_content('Google')
    end
  end
end
