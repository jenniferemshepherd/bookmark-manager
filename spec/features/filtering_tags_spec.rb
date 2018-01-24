feature 'filtering tags' do
  scenario 'user filter by tag' do
    create_link_with_tag('www.google.co.uk', 'Google', 'search')
    create_link_with_tag('www.bbc.co.uk', 'BBC', 'news')
    create_link_with_tag('www.bing.com', 'Bing', 'search')

    visit '/tags/search'

    expect(page).to have_content('Google' && 'Bing')
    expect(page).not_to have_content('BBC')
  end
end
