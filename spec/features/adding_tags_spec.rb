feature 'Adding tags' do
  scenario 'I can create a new favourite with a tag' do
    visit '/favourites/new'
    fill_in 'url',   with: 'www.google.co.uk'
    fill_in 'title', with: 'Google'
    fill_in 'tags', with: 'Search'
    click_button 'Create favourite'

    link = Link.first
    expect(link.tags.map(&:name)).to include('Search')
  end

  scenario 'I can add multiple tags to a new link' do
    visit '/favourites/new'
    fill_in 'url',   with: 'www.yahoo.com'
    fill_in 'title', with: 'Yahoo'
    fill_in 'tags',  with: 'search rubbish'
    click_button 'Create favourite'
    link = Link.first
    expect(link.tags.map(&:name)).to include('search', 'rubbish')
  end
end
