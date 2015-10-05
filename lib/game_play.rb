require_relative 'game_display'

class GamePlay

  def get_user_input
    Display.new.intro
    sleep 2
    Display.new.main_menu
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
    @dictionary_array = File.readlines "5desk.txt"
    @dictionary_array.delete_if {|x| x.length < 6  || x.length >  14}  
    @new_dictionary = @dictionary_array.shuffle!
    @new_dictionary.map! &:downcase
    @word = @new_dictionary[4].chars
    @word.delete("\n")
    @remaining_letters = @word.clone
    p @word.join
    @lives = 4
    lives
  end


  def lives
    if (@word.length) > 7
      @lives = (@word.length / 2) + 3
    else 
      @lives
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


  def visual_update
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
      Display.new.display_save_menu
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
    if @remaining_letters.include? (@guess)
      good_guess
    elsif /^[A-Za-z, *]$/ !~ @guess
      puts "\nWrong Input, Please type a letter"
      game_play
    elsif @guess == "*"
      save_quit
    else
     failure
    end
  end


  def good_guess
    @word.each_with_index {|item, index|
      if item = @guess 
        @position = index
      end
    }
    @remaining_letters.delete(@guess)
    Display.new.display_good_guess
    display_lives 
    visual_update
  end


  def failure
    Display.new.display_wrong_guess
    @lives -= 1
    display_lives 
    visual_update
  end


  def game_over 
    puts " THE CORRECT WORD IS: #{@word.join(' ')}"
    Display.new.display_game_over
    @restart_gameover = gets.chomp.downcase.strip
    case @restart_gameover
      when "y" then get_user_input
      when "n" then exit
      else
        puts "invalid entry, exiting game....................."
        exit    
    end
  end


  def overall_success
    Display.new.display_good_game
    @restart_success = gets.chomp.downcase.strip
    case @restart_success
      when "y" then get_user_input
      when "n" then exit
      else
        puts "invalid entry, exiting game....................."
        exit      
    end
  end


 def save_game
  puts "\nInput a custom name for your saved data\n"
  @username = gets.chomp.strip
    if @username.length > 8 
      puts "\nName too long, try again\n" 
      save_game
   else 
      @save_name = @username.to_s + '.txt'
      Display.new.display_save_successful
      save_data 
    end
  end


  def save_data 
    File.open(@save_name,'w+') do | line |
      line.puts @word.join(",")
      line.puts @remaining_letters.join(",")
      line.puts @answer.join(",")
      line.puts @lives
    end
    visual_update
  end


  def load_game
    puts "Type the name of your saved game"
    @load_username = STDIN.gets.chomp.downcase
    if File.file?("#{@load_username}"+".txt")
      load_file
    else
      Display.new.display_load_failed
      sleep 1
      get_user_input
    end
  end

  def load_file
    @load_file = File.readlines("#{@load_username}"+".txt")
    @load_file.map! do |item|  
      item.chomp.delete(",")
    end
    @word = @load_file[0].chars
    @remaining_letters = @load_file[1].chars
    @answer = @load_file[2].chars
    @lives = @load_file[3].to_i
    Display.new.display_load_successful
    visual_update
  end

end

# GamePlay.new.get_user_input