require 'rubyscriptwriter'

class RubySpecWriter < RubyScriptWriter
  def put_description(thing_being_described)
    puts "describe ", thing_being_described, " do"
    indent
    yield self
    outdent
    puts "end"
    puts
  end
  
  def put_spec(specficiation_in_words)
    puts "it '",specficiation_in_words.tr("'",""), "' do"
    indent
    yield self
    outdent
    puts "end"
    puts
  end
end