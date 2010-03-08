$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'ruby_script_writer'

describe RubyScriptWriter do
  
  it "#initialize should create an empty string by default" do
    r = RubyScriptWriter.new
    r.to_s.should == ""
  end
  
  it "#puts should allow any text to be put, with newlines added automatically" do
    r = RubyScriptWriter.new
    r.puts "# Hello world"
    r.puts "# again"
    r.to_s.should == "# Hello world\n# again\n"
  end
  
  it "#puts doesn't put anything if a nil value is supplied" do
    r = RubyScriptWriter.new
    r.puts nil
    r.to_s.should == ""
  end
  
  it "#puts puts a new line if no argument is supplied" do
    r = RubyScriptWriter.new
    r.puts
    r.to_s.should == "\n"
  end
  
  it "#puts should handle several arguments, concatenating them onto the same line" do
    r = RubyScriptWriter.new
    r.puts "one", " ", 2, 3.0
    r.to_s.should == "one 23.0\n"
  end
  
  it "#indent should add two spaces to the start a line for every time indent is called" do
    r = RubyScriptWriter.new
    r.puts "no indent"
    r.indent
    r.puts "one indent"
    r.indent
    r.puts "two indents"
    r.to_s.should == "no indent\n  one indent\n    two indents\n"
  end
  
  it "#outdent should reverse the effect of an indent every time outdent is called" do
    r = RubyScriptWriter.new
    r.puts "no indent"
    r.indent
    r.outdent
    r.puts "still no indent"
    r.indent
    r.indent
    r.outdent
    r.puts "one indent"
    r.to_s.should == "no indent\nstill no indent\n  one indent\n"
  end
  
  it "#comment adds a # to the start of the given line" do
    r = RubyScriptWriter.new
    r.comment "This is a comment"
    r.to_s.should == "# This is a comment\n"
  end
  
  it "#put_class generates classes, optionally with a superclass" do
    r = RubyScriptWriter.new
    r.put_class "One" do
      r.comment "part of class One"
    end
    r.put_class "Two", "One" do
      r.comment "part of class Two"
    end
    r.to_s.should == "class One\n  # part of class One\nend\n\nclass Two < One\n  # part of class Two\nend\n\n"
  end
  
  it "#put_simple_method generates single line methods" do
    r = RubyScriptWriter.new
    r.put_simple_method "a23", "b23 + 10"
    r.to_s.should == "def a23; b23 + 10; end\n"
  end
  
  it "#put_method for generating multiple line methods, optionally with arguments" do
    r = RubyScriptWriter.new
    r.put_method "one" do 
      r.comment "part of method one"
    end
    r.put_method "two","a","b","c" do
      r.comment "part of method two"
    end
    r.to_s.should == "def one\n  # part of method one\nend\n\ndef two(a,b,c)\n  # part of method two\nend\n\n"
  end
  
  it "#put_coding for generating a ruby 1.9 encoding line at the start. Defaults to utf-8" do
    r = RubyScriptWriter.new
    r.put_coding
    r.put_coding 'ascii'
    r.to_s.should == "# coding: utf-8\n# coding: ascii\n"
  end
  
  it "#put_description for generating rspec describe statements" do
    r = RubyScriptWriter.new
    r.put_description "Sheet1" do
      r.puts "Hello"
    end
    r.to_s.should == "describe Sheet1 do\n  Hello\nend\n\n"
  end
  
  it "#put_spec for generating rspec it should type statements" do
    r = RubyScriptWriter.new
    r.put_spec "a1 should be equal to b2" do
      r.puts "a1.should == b2"
    end
    r.to_s.should == "it \"a1 should be equal to b2\" do\n  a1.should == b2\nend\n\n"
  end
  
end