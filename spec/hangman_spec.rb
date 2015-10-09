require_relative "spec_helper"

  describe HangMan::GamePlay do
    before :each do
    @game = HangMan::GamePlay.new
    @display = HangMan::Display.new 
    @save_game = HangMan::SaveLoad.new
  end


  it "should check if class GamePlay exits" do
    expect(@game.class).to eql(HangMan::GamePlay)
  end

  it "should check if class Display exits" do
    expect(@display.class).to eql(HangMan::Display)
  end

  it "should check if class SaveLoad exits" do
    expect(@save_game.class).to eql(HangMan::SaveLoad)
  end

  describe "#get_user_input" do
    it "acts on the gets_user_input method" do
      allow(@display).to receive(:display_new_intro).and_return(nil)
      allow(@game).to receive(:sleep).and_return(nil)
      # allow(@display).to receive(:display_main_menu).and_return(nil)
      allow(@game).to receive(:gets).and_return("load")
      allow(@game).to receive(:load_initial_saved_game).and_return(true)
      expect(@game.get_user_input).to be true
    end
  end


    describe "#get_user_input" do
    it "acts on appropriate input" do
      allow(@display).to receive(:display_new_intro).and_return(nil)
      allow(@game).to receive(:puts).and_return(nil)
      allow(@display).to receive(:intro).and_return(nil)
      allow(@display.intro).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("start")
      allow(@game).to receive(:start_new_game).and_return(true)
      expect(@game.get_user_input).to be true
    end
  end


  describe "#get_user_input" do
    it "acts on appropriate input" do
      allow(@display).to receive(:display_new_intro).and_return(nil)
      allow(@game).to receive(:puts).and_return(nil)
      allow(@display).to receive(:intro).and_return(nil)
      allow(@display.intro).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("exit")
      allow(@game).to receive(:start_new_game).and_return(true)
      expect{@game.get_user_input}.to raise_error SystemExit
    end
  end


describe "#get_user_input" do
    it "acts on appropriate input" do
      allow(@display).to receive(:display_new_intro).and_return(nil)
      allow(@game).to receive(:puts).and_return(nil)
      allow(@display).to receive(:intro).and_return(nil)
      allow(@display.intro).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("test")
      allow(@game).to receive(:start_new_game).and_return(nil)
      expect{@game.get_user_input}.to raise_error SystemExit
    end
  end

  describe "#start_new_game" do
    it "acts on appropriate input" do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:sleep).and_return(nil)
      allow(@game).to receive(:load_libraries).and_return(true)
      expect(@game.start_new_game).to be true
    end
  end

  describe "#load_initial_saved_game" do
    it "acts on appropriate input" do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:sleep).and_return(nil)
      # require "pry"
      allow(@save_game).to receive(:load_game).and_return(true)
      allow(@game).to receive(:game_save_new).and_return(@save_game)
      # binding.pry
      expect(@game.load_initial_saved_game).to be true
    end
  end


  describe "#exit_game" do
    it "acts on appropriate input" do
      allow(@game).to receive(:puts).and_return(nil)
      expect{@game.exit_game}.to raise_error SystemExit
    end
  end

 
  describe "#generate_lives" do
    it "acts on appropriate input" do
      # @word.length = 11
      allow(@game.word).to receive(:length).and_return(11)
      allow(@game).to receive(:/).and_return(nil)
      allow(@game).to receive(:+).and_return(nil)
      allow(@game).to receive(:initial_visual_update).and_return(true)
      expect(@game.generate_lives).to be true
    end
  end

  describe "#generate_lives" do
    it "acts on appropriate input" do
      # @word.length = 11
      allow(@game.word).to receive(:length).and_return(11)
      allow(@game).to receive(:/).and_return(nil)
      allow(@game).to receive(:+).and_return(nil)
      allow(@game).to receive(:initial_visual_update).and_return(true)
      expect(@game.generate_lives).to be true
    end
  end


  describe "#display_lives" do
    it "acts on appropriate input" do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:visual_update).and_return(true)
      expect(@game.display_lives).to be true
    end
  end


  describe "#game_play" do
    it "acts on appropriate input" do
      allow(@game.lives).to receive(:==).and_return(0)
      # allow(@game).to receive(:puts).and_return(nil)
      # allow(@display).to receive(:intro).and_return(nil)
      # allow(@display.intro).to receive(:puts).and_return(nil)
      # allow(@game).to receive(:gets).and_return("exit")
      allow(@game).to receive(:game_over).and_return(true)
      expect(@game.game_play).to be true
    end
  end


  describe "#save_quit" do
    it "acts on appropriate input" do
      allow(@game).to receive(:game_save_new).and_return(@save_game)
      expect(@save_game).to eql(@game_save)
      expect(@game.save_quit).to be true
    end
  end


  describe "#save_quit" do
    it "acts on appropriate input" do
      # allow(@display).to receive(:display_save_menu)
      # allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("s")
      allow(@save_game).to receive(:save_game).and_return(true)
      
      # allow(@display).to receive(:intro).and_return(nil)
      # allow(@display.intro).to receive(:puts).and_return(nil)
      # allow(@game).to receive(:gets).and_return("exit")
      # allow(@game).to receive(:game_over).and_return(true)
      expect(@game.save_quit).to be true
    end
  end

  describe "#save_quit" do
    it "acts on appropriate input" do
      allow(HangMan::Display.new).to receive(:display_save_menu).and_return(nil)
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("q")
      allow(@save_game).to receive(:save_game).and_return(true)
      
      # allow(@display).to receive(:intro).and_return(nil)
      # allow(@display.intro).to receive(:puts).and_return(nil)
      # allow(@game).to receive(:gets).and_return("exit")
      # allow(@game).to receive(:game_over).and_return(true)
       expect{@game.save_quit}.to raise_error SystemExit
    end
  end

  # describe "#save_quit" do
  #   it "acts on appropriate input qqquit" do
  #     allow(@display).to receive(:display_save_menu).and_return(nil)
  #     # allow(@game).to receive(:puts).and_return(nil)
  #     allow(@game).to receive(:gets).and_return("q")
  #     # allow(@save_game).to receive(:save_game).and_return(true)
  #     # allow(@display).to receive(:intro).and_return(nil)
  #     # allow(@display.intro).to receive(:puts).and_return(nil)
  #     # allow(@game).to receive(:gets).and_return("exit")
  #     # allow(@game).to receive(:game_over).and_return(true)
  #      expect{@game.save_quit}.to raise_error SystemExit
  #   end
  # end



  describe "#save_quit" do
    it "acts on appropriate input qqquit" do
      allow(HangMan::Display.new).to receive(:display_save_menu).and_return(nil)
      allow(@game).to receive(:gets).and_return("r")
      # allow(@save_game).to receive(:save_game).and_return(true)
      # allow(@display).to receive(:intro).and_return(nil)
      # allow(@display.intro).to receive(:puts).and_return(nil)
      # allow(@game).to receive(:gets).and_return("exit")
      allow(@game).to receive(:game_play).and_return(true)
      expect(@game.save_quit).to be true
    end
  end


    describe "#save_quit" do
    it "acts on load game option of the save_quit method" do
      allow(HangMan::Display.new).to receive(:display_save_menu).and_return(nil)
      allow(@game).to receive(:gets).and_return("r")
      # allow(@save_game).to receive(:save_game).and_return(true)
      # allow(@display).to receive(:intro).and_return(nil)
      # allow(@display.intro).to receive(:puts).and_return(nil)
      # allow(@game).to receive(:gets).and_return("exit")
      allow(@game).to receive(:game_play).and_return(true)
      expect(@game.save_quit).to be true
    end
  end



# it "should check if class exits" do
#     expect(@game.class).to eql(HangMan::GamePlay)
#   end
  # describe "#exit_game" do
  #   it "acts on appropriate input" do
  #     allow(@game).to receive(:puts).and_return(nil)
  #     expect{@game.exit_game}.to raise_error SystemExit
  #   end
  # end


  # describe "#overall_success" do
  #   it "acts on appropriate input" do
  #     allow(@display).to receive(:display_good_game).and_return(nil)
  #     allow(@game).to receive(:gets).and_return("y")
  #     allow(@game).to receive(:get_user_input).and_return(true)
  #     expect(@game.overall_success).to be true
  #   end
  # end




  describe "#overall_success" do
    it "should be able to return false for overall success" do
      allow(@game).to receive(:display.display_good_game).and_return(nil)
      # allow(@display).to receive(:display_good_game).and_return(nil)
      allow(@game).to receive(:gets).and_return("n")
      allow(@game).to receive(:get_user_input).and_return(true)
      allow(@game).to receive(:exit).and_return(false)
      expect(@game.overall_success).to be false
    end
  end



  # describe "#overall_success" do
  #   it "acts on appropriate input" do
  #     allow(@display).to receive(:display_good_game).and_return(nil)
  #     allow(@game).to receive(:gets).and_return("n")
  #     allow(@game).to receive(:get_user_input).and_return(true)
  #     allow(@game).to receive(:exit).and_return(false)
  #     expect(@game.overall_success).to be false
  #   end
  # end


  describe "#game_over" do
    it "acts on appropriate input" do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game.word).to receive(:join).and_return("word")
      allow(@display).to receive(:display_game_over).and_return(nil)
      allow(@game).to receive(:gets).and_return("y")
      allow(@game).to receive(:get_user_input).and_return(nil)
      expect(@game.game_over).to be nil
    end
  end

  # describe "#game_over" do
  #   it "acts on appropriate input" do
  #     allow(@game).to receive(:puts).and_return(nil)
  #     allow(@game.word).to receive(:join).and_return("word")
  #     allow(@display).to receive(:display_game_over).and_return(nil)
  #     allow(@game).to receive(:gets).and_return("n")
  #     allow(@game).to receive(:get_user_input).and_return(nil)
  #     allow(@game).to receive(:exit).and_return(nil)
  #     expect(@game.game_over).to be nil
  #   end
  # end
end