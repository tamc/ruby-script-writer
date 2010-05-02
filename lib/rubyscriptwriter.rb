require 'stringio'

class RubyScriptWriter
  attr_reader :r
  
  def initialize
    @r = StringIO.new
    @tab_count = 0
  end
  
  def indent
    @tab_count += 1
  end
  
  def outdent
    @tab_count -= 1
  end
  
  def put_class(class_name,superclass_name = nil)
    puts "class #{class_name}#{ superclass_name && " < #{superclass_name}"}"
    indent
    yield self
    outdent
    puts "end"
    puts
  end
  
  def put_simple_method(method_name,*method_code)
    puts "def " + method_name + "; " + method_code.join + "; end"
  end
  
  def put_method(method_name,*arguments)
    if arguments.empty?
      puts "def ", method_name
    else
      puts "def ", method_name, "(", arguments.join(','), ")"
    end
    indent
    yield self
    outdent
    puts "end"
    puts
  end
  
  def put_coding(coding = 'utf-8')
    comment 'coding: ', coding
  end
  
  def comment(*args)
    puts "# ", *args
  end
  
  def puts(*args)
    if args.empty?
      r.puts
      return self
    end
    args.compact!
    r.puts tabs + args.join unless args.empty?
    self
  end
  
  def tabs
    "  " * @tab_count
  end

  def to_s
    r.string
  end
end