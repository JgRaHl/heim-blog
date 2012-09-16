activate :blog do |blog|
  blog.permalink = "artikel/:year/:month/:title/index.html"
end

set :css_dir,    'stylesheets'
set :js_dir,     'javascripts'
set :images_dir, 'images'

configure :build do
  activate :minify_css

  # Strip copyright comments in javascript files
  require 'uglifier'
  activate :minify_javascript, :compressor => ::Uglifier.new(:copyright => false)

  # Do not use get parameters, instead use hashes
  activate :asset_hash, :ignore => /MathJax/

  # activate :cache_buster

  activate :directory_indexes

  require "middleman-smusher"
  activate :smusher
end
