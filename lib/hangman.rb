require_relative 'hangman/game_display'
require_relative 'hangman/save_load'
require_relative 'hangman/dictionary'
require_relative 'hangman/game_play'
require_relative 'hangman/win_lose'

module HangMan
  class GamePlay
    attr_accessor :word, :remaining_letters, :visual, :answer, :guess, :lives, :game_save, :answer_display, :win_lose
    def initialize
      @game_save = SaveLoad.new(self)
      @display = Display.new
      @dictionary = Dictionary.new
      @win_lose = WinLose.new(self, @display)
    end 

    def get_user_input
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
      @word = @dictionary.generate_word
      generate_remaining_letters
    end


    def load_initial_saved_game
      puts "Checking for your game"
      sleep 1
      game_save.load_game
    end


    def exit_game
      puts "invalid entry, exiting game....................."
      exit
    end


    def generate_remaining_letters
      @remaining_letters = @word.clone
      generate_lives
    end


    def generate_lives
   
      if (word.length) > 7
        @lives = (word.length / 2) + 3
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
      @answer_display = '_ ' *  @word.length  
      @answer = @answer_display.split()
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
  end
end
    
   
