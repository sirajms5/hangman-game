# this class will be used for user input and validates it
class User

    def input_number(message)
        begin
        print message
        user_input = gets.chomp()
        is_valid = validate_number(user_input)
        end while !is_valid
    
        return user_input
    end

    def validate_number(user_input)
        words_hash_keys = /^[4-7]$/
        if user_input.match(words_hash_keys)
            
            return true
        else
            puts "Invalid entry. Please enter a number (4-7)."

            return false
        end
    end

    def input_character(message)
        begin
            print message
            user_input = gets.chomp()
            is_valid = validate_character(user_input)
        end while !is_valid

        return user_input
    end

    def validate_character(user_input)
        if user_input.length == 1 && user_input.match(/[a-zA-Z]/)

            return true
        else
            puts "Invalid entry. Please enter one letter"

            return false
        end
    end

    def input_string(message)
        print message
        user_input = gets.chomp()

        return user_input
    end
end