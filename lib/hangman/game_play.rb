module HangMan
  class GamePlay

   def visual_update
      @visual = @answer
        @word.each_with_index do |letter, index|
          if @guess == letter
              @visual[index] = letter
          end
        end
      p @visual.join("  ")
      game_play
    end

    def game_play
        if lives == 0
        @win_lose.game_over
      elsif lives > 0 && remaining_letters.length == 0
        puts "THE WORD IS:  #{word.join('')}"
        @win_lose.overall_success
      else
        puts "\nGuess a letter"
        @guess = gets.chomp.downcase.strip
        input_check
      end
    end 


    def save_quit
        puts @display.display_save_menu
        input_save_quit = gets.downcase.strip
        case input_save_quit
          when "s" then @game_save.save_game(self)
            # when "s" then @game_save.save_game(self)
          when "q" then exit
          when "r" then game_play
          when "l" then @game_save.load_game
            # when "l" then @game_save.load_game
          else 
            puts "\n Invalid Input, Try again"
            save_quit
        end
    end


    def input_check
      if @remaining_letters.include? (@guess)
        good_guess
      elsif /^[A-Za-z, *]$/ !~ @guess
        puts "\nWrong Input, Please type a letter"
        game_play
      elsif @guess == "*"
        save_quit
      else
       wrong_guess
      end
    end


    def good_guess
      @remaining_letters.delete(@guess)
      puts @display.display_good_guess
      display_lives 
      visual_update
    end



    def wrong_guess
      puts @display.display_wrong_guess
      @lives -= 1
      display_lives 
      visual_update
    end

  end

end