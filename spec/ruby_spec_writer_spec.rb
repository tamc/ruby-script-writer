$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'ruby_spec_writer'

describe RubySpecWriter do
  
  it "#put_description for generating rspec describe statements" do
    r = RubySpecWriter.new
    r.put_description "Sheet1" do
      r.puts "Hello"
    end
    r.to_s.should == "describe Sheet1 do\n  Hello\nend\n\n"
  end
  
  it "#put_spec for generating rspec it should type statements" do
    r = RubySpecWriter.new
    r.put_spec "a1 should be equal to b2" do
      r.puts "a1.should == b2"
    end
    r.to_s.should == "it 'a1 should be equal to b2' do\n  a1.should == b2\nend\n\n"
  end
  
end