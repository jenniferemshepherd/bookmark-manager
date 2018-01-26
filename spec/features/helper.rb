def create_link_with_tag(url, title, tag)
  link = Link.new(url: url, title: title)
  category = Tag.first_or_create(name: tag)
  link.tags << category
  link.save
end

def sign_in_correctly
  visit '/user/new'
  fill_in 'email', with: 'someone@google.com'
  fill_in 'password', with: 'secret'
  fill_in 'password_confirmation', with: 'secret'
  click_button 'Register'
end

def sign_in_incorrectly
  visit '/user/new'
  fill_in 'email', with: 'someone@google.com'
  fill_in 'password', with: 'secret'
  fill_in 'password_confirmation', with: 'incorrect'
  click_button 'Register'
end

def sign_in_without_email
  visit '/user/new'
  fill_in 'email', with: ''
  fill_in 'password', with: 'secret'
  fill_in 'password_confirmation', with: 'secret'
  click_button 'Register'
end

def sign_up_with_invalid_email
  visit '/user/new'
  fill_in 'email', with: 'dsfdsfdsf'
  fill_in 'password', with: 'secret'
  fill_in 'password_confirmation', with: 'secret'
  click_button 'Register'
end
