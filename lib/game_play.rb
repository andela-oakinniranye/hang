require_relative 'game_display'

class GamePlay

  attr_reader :word, :remaining_letters,:guess

  def get_user_input
# This method gets the user's input and calls the respective methods to handle the input
    puts Display.new.intro
    sleep 3
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
        load_game
      when "exit" then exit
      else
        puts "invalid entry, exiting game....................."
        exit
    end
  end


  def load_libraries
    # This method loads the library of words, filters the characters length and selects the word to be guessed
    @dictionary_array = File.readlines "5desk.txt"
    @dictionary_array.delete_if {|x| x.length < 6  || x.length >  14}  
    @new_dictionary = @dictionary_array.shuffle!
    @new_dictionary.map! &:downcase
    @word = @new_dictionary[4].chars
    @word.delete("\n")
    @remaining_letters = @word.clone
    # p @word.join
    lives
  end


  def lives
    # this method instanciates the user's available guesses based on the length of the word to be guessed
    if (@word.length) > 7
      @lives = (@word.length / 2) + 3
    else 
      @lives = 4
    end
    initial_visual_update 
  end

  def display_lives
    # This method displays the amount of guesses left for the user
    puts "\n You have #{@lives} guess(es) left"
    visual_update
  end

  def initial_visual_update
    # this method shows the default number of missing letters in the word to be guesssed
    @answer = Array.new(@word.length)
    @answer.map! do |item|
      item = "_" 
    end
    @answer_display = @answer.join("  ")
    p @answer_display
    game_play
  end


  def visual_update
    # this method updates the user's input after each correct guess
    @visual = @answer
    if @word.include? @guess
      @word.each_with_index do |letter, index|
        if @guess == letter
            @visual[index] = letter
        end
      end  
    end
    p @visual.join("  ")
    game_play
  end


  def game_play
=begin
this method checks for the user's remaining guesses and success status. 
    It calls the appropriate method required to handle each condition
=end

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
=begin
    this method handles the user menu option to either save or load a particular game and calls the respective method based on user's input
    it also provides available options for exit 
=end
      puts Display.new.display_save_menu
      @save_quit = gets.strip
      case @save_quit
        when "s" then save_game
        when "q" then exit
        when "r" then game_play
        when "l" then load_game
        else 
          puts "\n Invalid Input, Try again"
          save_quit
      end
  end

  def input_check
=begin
    this method filters the users input and ensures the user inputs a letter 
    It also calls the method to handle each respective exception
=end
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
        puts "invalid entry, exiting game....................."
        exit    
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
        puts "invalid entry, exiting game....................."
        exit      
    end
  end


 def save_game
  # this method handles the option for saving the user's game 
  puts "\nInput a custom name for your saved data\n"
  @username = gets.chomp.strip
    if @username.length > 8 
      puts "\nName too long, try again\n" 
      save_game
   else 
      @save_name = @username.to_s + '.txt'
      puts Display.new.display_save_successful
      save_data 
    end
  end


  def save_data 
    # this method is called by the save_game method and handles the responsibilty of writing the game's state to a txt file
    File.open(@save_name,'w+') do | line |
      line.puts @word.join(",")
      line.puts @remaining_letters.join(",")
      line.puts @answer.join(",")
      line.puts @lives
    end
    visual_update
  end


  def load_game
    # this method handles the loading of your file 
    puts "Type the name of your saved game"
    @load_username = STDIN.gets.chomp.downcase
    if File.file?("#{@load_username}"+".txt")
      load_file
    else
      puts Display.new.display_load_failed
      sleep 1
      get_user_input
    end
  end

  def load_file
    # this method handles the reading of the reqired file to be loaded
    @load_file = File.readlines("#{@load_username}"+".txt")
    @load_file.map! do |item|  
      item.chomp.delete(",")
    end
    @word = @load_file[0].chars
    @remaining_letters = @load_file[1].chars
    @answer = @load_file[2].chars
    @lives = @load_file[3].to_i
    puts Display.new.display_load_successful
    visual_update
  end

end

# GamePlay.new.get_user_input