Gem::Specification.new do |s|
  s.name = "rubyscriptwriter"
  s.version = '0.0.1'
  s.author = "Thomas Counsell, Green on Black Ltd"
  s.email = "ruby-script-writer@greenonblack.com"
  s.homepage = "http://wiki.github.com/tamc/ruby-script-writer"
  s.platform = Gem::Platform::RUBY
  s.summary = "A small library for programmatically creating well formatted ruby scripts"
  s.files = ["LICENSE", "README", "{spec,lib}/**/*"].map{|p| Dir[p]}.flatten
  s.require_path = "lib"
  s.has_rdoc = false
end