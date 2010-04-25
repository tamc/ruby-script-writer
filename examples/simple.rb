require_relative '../lib/rubyscriptwriter'
r = RubyScriptWriter.new
r.put_class "One" do
  r.put_method "a", "arg1","arg2" do
    r.puts "return arg1 + arg2"
  end
end
puts r