class Display 
  def intro
    puts "\n"
    puts "    ============================="
    puts "     --------------------------- "
    puts "                                 "
    puts "        WELCOME TO HANGMAN       "
    puts "                                 "
    puts "     --------------------------- "
    puts "    ============================="
    puts "\n"
  end 

  def main_menu
    puts "\n"
    puts "\nType \"start\" to Start a new game\nType \"load\" to load a previously saved game\nAnd \"exit\" to Exit game\n"
    sleep 1
  end


  def display_good_guess
    puts "\n CORRECT!! \n"
  end 


  def display_wrong_guess
    puts "\n INCORRECT! TRY AGAIN"
    puts "\n"
  end


  def display_load_successful
   puts "\n LOAD SUCCESSFUL! \n"
  end

  def display_load_failed
    puts "\n FILE  NOT FOUND! \n"
  end


  def display_save_successful
    puts "\n SAVE SUCCESSFUL! \n"
  end


  def display_save_menu
    puts "\n Press 's' to save, 'l' to load, 'q' to quit and 'r' to return "
    puts "\n"
  end


  def display_good_game
    puts "\nCONGRATULATIONS! YOU HAVE WON!"
    puts "\nWould You like to Play Again? (Y/N)"
  end


  def display_game_over 
    puts "\n"
    puts "GAME-OVER!\n"
    puts "\nWould you like to restart? (Y/N)\n"
  end


  
end

