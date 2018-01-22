feature 'Home Page' do
  scenario 'Should visit favourites page and see links ' do
    Favourite.create(url: 'http://www.makersacademy.com', title: 'Makers Acdemy')

    visit '/favourites'
    expect(page.status_code).to eq 200

    within 'ul#favourites' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
