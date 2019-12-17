require "pry"
require_relative "../spec/solution_spec.rb"
# require_relative "../spec/spec_helper.rb"

    parsed_input = []
    if ARGV.length != 1
      puts "We need exactly one parameter. The name of the file."
    end

    filename = ARGV[0]

    File.open(filename).each do |line|
      # binding.pry
      parsed_input << line.split(/\n+/)
    end


 class SimpleTextEditor
   attr_accessor :input

   def initialize(input)
     @input = input
   end

    def print_output
      stack = []
      s = ""
        @input.map do |line|
          command = line[0].split()[0]
          case command
              when "1"
                stack.push(s)
                s += line[0].split[1]
              when "2"
               #push to stack as is then set string to range
               #of 0 to k back from last
               stack.push(s)
               s = s.slice(0, line[1].to_i)
             when "3"
                # binding.pry
               puts s[line.join("")[2].to_i - 1]
             when "4"
                #set string to last state
                s = stack.pop()
            end
        end
      end

   end


if __FILE__ == $0
  output = SimpleTextEditor.new(parsed_input)
  output.print_output
end
