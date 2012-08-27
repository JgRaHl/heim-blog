activate :blog do |blog|
  blog.permalink = "artikel/:year/:month/:title"
end

set :css_dir,    'stylesheets'
set :js_dir,     'javascripts'
set :images_dir, 'images'

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
  activate :directory_indexes

  require "middleman-smusher"
  activate :smusher
end
