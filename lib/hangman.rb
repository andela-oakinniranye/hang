require_relative 'hangman/game_display'
require_relative 'hangman/save_load'
module HangMan
  class GamePlay
    attr_reader :word, :remaining_letters, :answer, :guess, :lives, :game_save_new, :game_save, :game_save_new

    def get_user_input
      @game_save_new = SaveLoad.new
      @display = Display.new
      puts @display.intro
      sleep 1.5
      puts @display.main_menu
      user_input = gets.chomp.downcase
      case user_input
        when "start" then start_new_game
        when "load" then load_initial_saved_game
        when "exit" then exit
        else
         exit_game
      end
    end

    def start_new_game
      puts "You can press '*' at any point to access the save and exit menu"
      sleep 1.5
      load_libraries
    end

    def load_initial_saved_game
      puts "Checking for your game"
      sleep 1
      game_save_new.load_game
    end

    def exit_game
       puts "invalid entry, exiting game....................."
          exit
    end

 
    def load_libraries 
      @dictionary_array = File.readlines("hangman/5desk.txt")
      @dictionary_array.delete_if {|x| x.length < 6  || x.length >  14}  
      @new_dictionary = @dictionary_array.shuffle!
      @new_dictionary.map! &:downcase
      @word = @new_dictionary[4].chars
      @word.delete("\n")
      @remaining_letters = @word.clone
      generate_lives
    end


    def generate_lives
      if (@word.length) > 7
        @lives = (@word.length / 2) + 3
      else 
        @lives = 4
      end
      initial_visual_update 
    end


    def display_lives
      puts "\n You have #{@lives} guess(es) left"
      visual_update
    end

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
      @display = Display.new
      @word = word_loaded
      @remaining_letters = remaining_letters_loaded
      @answer = answer_loaded
      @lives = lives_loaded
      visual_update
    end

    def visual_update(obj = nil)
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


    def save_quit
        @game_save = SaveLoad.new
        puts @display.display_save_menu
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



    def game_over
      puts "\n THE CORRECT WORD IS: #{@word.join(' ')}"
      puts @display.display_game_over
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
      puts @display.display_good_game
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
    
   
