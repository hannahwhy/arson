require 'handlebars/source'
require 'sprockets'

map '/assets' do
  env = Sprockets::Environment.new
  env.append_path 'vendor/assets/javascripts'
  env.append_path 'vendor/assets/stylesheets'
  env.append_path File.dirname(Handlebars::Source.bundled_path)
  run env
end

map '/tagger/test.html' do
  run lambda { |*| [200, { 'Content-Type' => 'text/html' }, [File.read('tagger/test.html')]] }
end

map '/tagger/test.js' do
  run lambda { |*| [200, { 'Content-Type' => 'text/html' }, [File.read('tagger/test.js')]] }
end
