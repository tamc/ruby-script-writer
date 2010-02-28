Gem::Specification.new do |s|
  s.name = "ruby-script-writer"
  s.version = '0.0.1'
  s.author = "Thomas Counsell, Green on Black Ltd"
  s.email = "ruby-script-writer@greenonblack.com"
  # s.homepage = "http://functionalform.blogspot.com"
  s.platform = Gem::Platform::RUBY
  s.summary = "A small library to help programatically create well formatted ruby scripts"
  s.files = ["LICENSE", "README", "{spec,lib,bin,doc,examples}/**/*"].map{|p| Dir[p]}.flatten
  s.require_path = "lib"
  s.has_rdoc = false
end