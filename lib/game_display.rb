module HangMan  
  class Display 
    def intro
      <<-EOS
      
          =============================
           --------------------------- 
                                       
               WELCOME TO HANGMAN   


                  +--------+
                  |        |
                  |        O
                  |       /|\\
                  |       /*\\
                  |      
                --=------------
      
                                       
           --------------------------- 
          =============================
     EOS
    end 

    def main_menu
      <<-EOS

      Type 'start' to Start a new game
      Type 'load' to Load a previously saved game 
      And 'exit' to Exit game

      EOS
    end


    def display_good_guess
      <<-EOS
      CORRECT!!
      EOS
    end 


    def display_wrong_guess
     <<-EOS

      INCORRECT! TRY AGAIN!!

      EOS
    end


    def display_load_successful
     <<-EOS

      LOAD SUCCESSFUL! 

      EOS
    end

    def display_load_failed
      <<-EOS 
      FILE NOT FOUND! 
      EOS
    end


    def display_save_successful
      <<-EOS

       SAVE SUCCESSFUL!
      
       EOS
    end


    def display_save_menu
      <<-EOS
       Press 's' to Save, 'l' to Load, 'q' to Quit and 'r' to Return "

      EOS
    end


    def display_good_game
      <<-EOS

      ****CONGRATULATIONS!!! YOU HAVE WON!******

      Would You like to Play Again? (Y/N)

      EOS
    end


    def display_game_over 
      <<-EOS

            GAME-OVER!!!! :(

      Would you like to restart? (Y/N)

       EOS
    end
  end
end