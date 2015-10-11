module HangMan  

  class SaveLoad

    def save_game(obj = nil)
      puts "\nInput a custom name for your saved data\n"
      @username = gets.chomp.strip
        if @username.length > 8 
          puts "\nName too long, try again\n" 
          save_game
        elsif @username.length <= 0
          puts "Invalid input, Try again" 
          save_game
       else 
          @save_name = @username.to_s + '.txt'
          save_data(obj) 
        end
    end

    def save_data(obj = nil)
      File.open(@save_name,'w+') do | line |
        line.puts obj.word.join(",")
        line.puts obj.remaining_letters.join(",")
        line.puts obj.answer.join(",")
        line.puts obj.lives
      end
      puts Display.new.display_save_successful
      save_continue(obj)
    end
  
    def save_continue(obj = nil)
      puts Display.new.display_save_continue
      @save_continue = gets.chomp.strip
      case @save_continue
        when "c" then obj.visual_update
        when "q" then exit
          else 
           obj.exit_game
      end
    end


    def load_game(obj = nil)
      puts "Type the name of your saved game"
      @load_username = STDIN.gets.chomp.downcase
      if File.file?("#{@load_username}"+".txt")
        load_file(obj)
      else
        load_failed(obj)
      end
    end


    def load_failed(obj = nil)
      puts Display.new.display_load_failed
      sleep 1
      obj.get_user_input
    end 


    def load_file(obj = nil)
      @load_file = File.readlines("#{@load_username}"+".txt")
      @load_file.map! do |item|  
        item.chomp.delete(",")
      end      
      continue_loaded_game(obj)
    end

    def continue_loaded_game(obj = nil)
      word_loaded = @load_file[0].chars
      remaining_letters_loaded = @load_file[1].chars
      answer_loaded = @load_file[2].chars
      lives_loaded = @load_file[3].to_i
      obj = obj || GamePlay.new
      obj.load_saved_game(word_loaded, remaining_letters_loaded, answer_loaded, lives_loaded)
    end

  end
end
  