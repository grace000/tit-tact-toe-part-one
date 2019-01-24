require_relative './input_validator'
require_relative './command_line_input'

class Input
    attr_accessor :input_type
    def initialize(input_type = CommandLineInput.new)
        @input_type = input_type
    end

    def get_token
        input = input_type.get_input 
        validator = InputValidator.new
        while !validator.valid_token?(input) do
            puts "Try again. Please enter valid token."
            input = input_type.get_input 
        end
        input.upcase
    end
end

