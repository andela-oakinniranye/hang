require_relative 'hangman_game_display'
require_relative 'hangman_save_load'
module HangMan
  class GamePlay
    attr_reader :word, :remaining_letters, :answer, :guess, :lives, :game_save_new, :game_save 

    def get_user_input
  # This method gets the user's input and calls the respective methods to handle the input
      # @game_save_new = SaveLoad.new(@word, @lives, @answer, @remaining_letters)
      @game_save_new = SaveLoad.new
      puts Display.new.intro
      sleep 1.5
      puts Display.new.main_menu
      user_input = gets.chomp.downcase
      case user_input
        when "start" 
          puts "You can press '*' at any point to access the save and exit menu"
          sleep 1.5
          load_libraries
        when "load" 
          puts "Checking for your game"
          sleep 1
          @game_save_new.load_game
        when "exit" then exit
        else
          puts "invalid entry, exiting game....................."
          exit
      end
    end


 # This method loads the library of words, filters the characters length and selects the word to be guessed
    def load_libraries 
      @dictionary_array = File.readlines("5desk.txt")
      @dictionary_array.delete_if {|x| x.length < 6  || x.length >  14}  
      @new_dictionary = @dictionary_array.shuffle!
      @new_dictionary.map! &:downcase
      @word = @new_dictionary[4].chars
      @word.delete("\n")
      @remaining_letters = @word.clone
      # p @word.join
      generate_lives
    end

# this method instanciates the user's available guesses based on the length of the word to be guessed
    def generate_lives
      if (@word.length) > 7
        @lives = (@word.length / 2) + 3
      else 
        @lives = 4
      end
      initial_visual_update 
    end

# This method displays the amount of guesses left for the user
    def display_lives
      puts "\n You have #{@lives} guess(es) left"
      visual_update
    end

 # this method shows the default number of missing letters in the word to be guesssed
    def initial_visual_update
      @answer = Array.new(@word.length)
      @answer.map! do |item|
        item = "_" 
      end
      @answer_display = @answer.join("  ")
      p @answer_display
      game_play
    end


   def load_saved_game(word_loaded, remaining_letters_loaded, answer_loaded, lives_loaded)
      @word = word_loaded
      @remaining_letters = remaining_letters_loaded
      @answer = answer_loaded
      @lives = lives_loaded
      visual_update
    end

# this method updates the user's input after each correct guess
    def visual_update(obj = nil)

      @visual = @answer
      # if @word.include? @guess
        @word.each_with_index do |letter, index|
          if @guess == letter
              @visual[index] = letter
          end
        # end  
      end
      # p @word
      p @visual.join("  ")
      game_play
    end




# this method checks for the user's remaining guesses and success status. 
#     It calls the appropriate method required to handle each condition
    def game_play
        if @lives == 0
        game_over
      elsif @lives > 0 && @remaining_letters.length == 0
        puts "THE WORD IS:  #{@word.join('')}"
        overall_success
      else
        puts "\nGuess a letter"
        @guess = gets.chomp.downcase.strip
        input_check
      end
    end 


#     this method handles the user menu option to either save or load a particular game and calls the respective method based on user's input
#     it also provides available options for exit 
    def save_quit
        # @game_save = SaveLoad.new(@word, @lives, @answer, @remaining_letters) 
        @game_save = SaveLoad.new
        puts Display.new.display_save_menu
        @save_quit = gets.strip
        case @save_quit
          when "s" then @game_save.save_game(self)
          when "q" then exit
          when "r" then game_play
          when "l" then @game_save.load_game
          else 
            puts "\n Invalid Input, Try again"
            save_quit
        end
    end



    # this method filters the users input and ensures the user inputs a letter 
      # It also calls the method to handle each respective exception
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
      # this method is called when the user makes correct guess
      @remaining_letters.delete(@guess)
      puts Display.new.display_good_guess
      display_lives 
      visual_update
    end


    def wrong_guess
      # this method is called when a user makes a wrong guess
      puts Display.new.display_wrong_guess
      @lives -= 1
      display_lives 
      visual_update
    end


    def game_over
      # this method is called when the user has no available guesses left
      puts "\n THE CORRECT WORD IS: #{@word.join(' ')}"
      puts Display.new.display_game_over
      restart_gameover = gets.chomp.downcase.strip
      case restart_gameover
        when "y" then get_user_input
        when "n" then exit
        else
          puts "invalid entry, try again"
          game_over
      end
    end


    def overall_success
      # this method is called when the user has guessed the word completely
      puts Display.new.display_good_game
      restart_success = gets.chomp.downcase.strip
      case restart_success
        when "y" then get_user_input
        when "n" then exit
        else
          puts "invalid entry, try again"
          game_over      
      end
    end
  end
end
    
#   end
# end


   

HangMan::GamePlay.new.get_user_input