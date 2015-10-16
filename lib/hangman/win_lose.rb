module HangMan
  class WinLose
    def initialize(game_play, display)
      @display = display
      @game_play = game_play
    end 


    def game_over
      puts "\n THE CORRECT WORD IS: #{@game_play.word.join(' ')}"
      puts @display.display_game_over
      restart_gameover = gets.chomp.downcase.strip
      case restart_gameover
        when "y" then @game_play.get_user_input
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
        when "y" then @game_play.get_user_input
        when "n" then exit
        else
          puts "invalid entry, try again"
          overall_success      
      end
    end
  end
end