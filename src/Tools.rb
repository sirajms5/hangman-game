module Tools

    def show_answer(letter_count, correct_answers)
        letter_count.to_i.times do |index|
            if correct_answers[index] != nil
                print correct_answers[index]
            else
                print "_ "
            end
        end
        puts ""
    end

    def initialize_board(letter_count, correct_answers)
        letter_count.to_i.times do |index|

            if correct_answers[index] == nil
                correct_answers[index] = "_ "
            end
    
            print correct_answers[index]
        end
    end
end