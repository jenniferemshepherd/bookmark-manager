def create_link_with_tag(url, title, tag)
  link = Link.new(url: url, title: title)
  category = Tag.first_or_create(name: tag)
  link.tags << category
  link.save
end
