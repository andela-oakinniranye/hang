require_relative "spec_helper"

  describe GamePlay do
    before :each do
    @game = GamePlay.new
  end


    it "should do something" do
      expect(@game.class).to eql(GamePlay)
    end


  

 # describe "#input_check" do

 #    it "throws error when instantiated with 2 or more parameters" do
 #      expect(GamePlay.new.input_check.ins).to raise_error ArgumentError
 #    end
  # end
  # describe "new shirt" do
  # it "should be an instance of a Shirt object"
  #   expect(@object).to be_a Shirt
  # end

  # describe "visual_update" do
  #   it "acts on appropriate input" do 

  # end



  describe "#lives" do
    it "acts on appropriate input" do
      word = "derogatory"
      # allow(Display.new).to receive(:display_new_intro).and_return(nil)
      # allow(@game).to receive(:sleep).and_return(nil)
      # allow(@game.word).to receive(:length).and_return(10)
      # allow(Display.new).to receive(:display_main_menu).and_return(nil)
      # allow(Display.new).to receive(:display_game_over).and_return(nil)
      # allow(@game).to receive(:gets).and_return("load")
      # allow(@game).to receive(:puts).and_return(nil)
      # allow(@game).to receive(:sleep).and_return(nil)
      # allow(@game).to receive(:load_libraries).and_return(false)
      # allow(@game).to receive(:puts).and_return(nil)
      # allow(@game).to receive(:sleep).and_return(nil)
      allow(@game).to receive(:initial_visual_update).and_return(nil)
      expect(@game.lives).to be_a Integer
    end
  end






 describe "#input_check" do
    it "acts on appropriate input" do
      # allow(Display.new).to receive(:display_new_intro).and_return(nil)
      # allow(@game).to receive(:sleep).and_return(nil)
      # allow(@game.remaining_letters).to receive(:include).and_return(true)
      allow(@game).to receive(:good_guess).and_return(true)
      # allow(Display.new).to receive(:display_main_menu).and_return(nil)
      # allow(Display.new).to receive(:display_game_over).and_return(nil)
      # allow(@game).to receive(:gets).and_return("load")
      # # allow(@game).to receive(:puts).and_return(nil)
      # allow(@game).to receive(:sleep).and_return(nil)
      # allow(@game).to receive(:load_libraries).and_return(false)
      # allow(@game).to receive(:puts).and_return(nil)
      # allow(@game).to receive(:sleep).and_return(nil)
      # allow(@game).to receive(:load_game).and_return(true)
      @game.remaining_letters
      @game.guess
      expect(@game.input_check).to be nil
    end
  end



   describe "#get_user_input" do
    it "acts on appropriate input" do
      allow(Display.new).to receive(:display_new_intro).and_return(nil)
      allow(@game).to receive(:sleep).and_return(nil)
      # allow(@game.word).to receive(:join).and_return("word")
      allow(Display.new).to receive(:display_main_menu).and_return(nil)
      # allow(Display.new).to receive(:display_game_over).and_return(nil)
      allow(@game).to receive(:gets).and_return("load")
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:sleep).and_return(nil)
      allow(@game).to receive(:load_libraries).and_return(false)
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:sleep).and_return(nil)
      allow(@game).to receive(:load_game).and_return(true)
      expect(@game.get_user_input).to be true
    end
  end

    describe "#get_user_input" do
    it "acts on appropriate input" do
      allow(Display.new).to receive(:display_new_intro).and_return(nil)
      allow(@game).to receive(:puts).and_return(nil)
      # allow(@game.word).to receive(:join).and_return("word")
      allow(Display.new).to receive(:display_main_menu).and_return(nil)
      # allow(Display.new).to receive(:display_game_over).and_return(nil)
      allow(@game).to receive(:gets).and_return("start")
      allow(@game).to receive(:load_libraries).and_return(true)
      expect(@game.get_user_input).to be true
    end
  end

  describe "#overall_success" do
    it "acts on appropriate input" do
      allow(Display.new).to receive(:display_good_game).and_return(nil)
      allow(@game).to receive(:gets).and_return("y")
      allow(@game).to receive(:get_user_input).and_return(true)
      expect(@game.overall_success).to be true
    end
  end


  describe "#overall_success" do
    it "acts on appropriate input" do
      allow(Display.new).to receive(:display_good_game).and_return(nil)
      allow(@game).to receive(:gets).and_return("n")
      allow(@game).to receive(:get_user_input).and_return(true)
      allow(@game).to receive(:exit).and_return(false)
      expect(@game.overall_success).to be false
    end
  end
  
  # describe "#wrong_guess" do
  #   it "acts on appropriate input" do
  #     allow(Display.new).to receive(:display_wrong_guess).and_return(nil)
  #     allow(@game.lives).to eql (7)
  #     allow(@game).to receive(:display_lives).and_return(nil)
  #     allow(@game).to receive(:visual_update).and_return(nil)
  #     expect(@game.lives).to eql (6)
  #   end
  # end


  describe "#save_game" do
    it "acts on appropriate input" do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return(true)
      allow(@game).to receive(:puts).and_return(nil)
      allow(Display.new).to receive(:display_save_successful).and_return(false)
      allow(@game).to receive(:save_game).and_return(true)
      expect(@game.overall_success).to be true
    end
  end

  describe "#save_game" do
    it "acts on appropriate input" do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return(false)
      allow(@game).to receive(:puts).and_return(nil)
      allow(Display.new).to receive(:display_save_successful).and_return(true)
      allow(@game).to receive(:save_data).and_return(true)
      expect(@game.overall_success).to be true
    end
  end

  describe "#game_over" do
    it "acts on appropriate input" do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game.word).to receive(:join).and_return("word")
      allow(Display.new).to receive(:display_game_over).and_return(nil)
      allow(@game).to receive(:gets).and_return("y")
      allow(@game).to receive(:get_user_input).and_return(nil)
      expect(@game.game_over).to be nil
    end
  end

end