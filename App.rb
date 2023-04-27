require "json"
# require_relative "Methods_factory.rb"
# include Methods_factory

file = File.read("words.json")
words = JSON.parse(file)

print "Enter how many letters a word can have (4, 5, 6, 7): "
letter_count = gets.chomp()
word = words[letter_count][rand(0..49)].downcase()
correct_answers = []
lives = 7

# Methods_factory.correct_letters(letter_count.to_i, correct_answers) # to show correct letters and their position in the word

# initial start
letter_count.to_i.times do |index|
    if correct_answers[index] == nil
         correct_answers[index] = "_ "
    end
    print correct_answers[index]
end
puts ""

# to check if letter or number
def validate_letter(choice)
    if choice.length == 1 && choice.match(/[a-zA-Z]/)
        return true
    else
        puts "Invalid entry. Please enter one letter"
        return false
    end
end

# get letter
def get_letter()
    begin
        print "Enter a letter: "
        choice = gets.chomp()
        is_valid = validate_letter(choice)
    end while !is_valid
    return choice
end
    
# todo: construct a loop that goes through duplicate letters
i = 30
begin    
    choice = get_letter().downcase()
    is_correct_choice = word.include? choice
    if is_correct_choice
        index = word.index(choice)
        word[index] = "-"
        puts word
    else
        puts "wrong answer"
    end
    i -= 1
end while i > 5
    
    