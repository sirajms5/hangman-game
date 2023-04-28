# This application will run a hangman game where user enters letters to match a hidden word

require "json"
require_relative "src/User.rb"
require_relative "src/Tools.rb"
include Tools

file = File.read("src/words.json")
words = JSON.parse(file)
user = User.new()

begin
    letter_count = user.input_number("Enter how many letters a word can have (4, 5, 6, 7): ")

    word = words[letter_count][rand(0..49)].downcase()
    correct_answers = []

    Tools.initialize_board(letter_count, correct_answers)
    
    puts "" # for better readability

    lives = 10
    choices = []

    begin    
        choice = user.input_character("Enter a letter: ").downcase()
        repeated_choice = choices.include? choice
        is_correct_choice = word.include? choice

        if is_correct_choice && !repeated_choice
            word.each_char().with_index() do |character, index|                
                if character == choice
                    correct_answers[index] = character
                end
            end   

            choices.push(choice)
        elsif repeated_choice
            puts "You already picked this letter. Please choose another letter."
        else
            choices.push(choice)
            lives -= 1
            puts "Wrong answer! Remaining lives: #{lives} / 10"           
        end

        Tools.show_answer(letter_count, correct_answers)        
    end while lives > 0 && (correct_answers.include? "_ ")

    if !(correct_answers.include? "_ ")
        puts "Congratulations! You WON!"
    else
        puts "You ran our of lives. Correct answer is: #{word}."
    end

    play_again = user.input_string("Play again? (Y/N): ").downcase()
end while (play_again == "y")
    