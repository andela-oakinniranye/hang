require_relative "spec_helper"

  describe GamePlay do
    before :each do
    @game = GamePlay.new
  end


  it "should check if class exits" do
    expect(@game.class).to eql(GamePlay)
  end



   describe "#get_user_input" do
    it "acts on the gets_user_input method" do
      allow(Display.new).to receive(:display_new_intro).and_return(nil)
      allow(@game).to receive(:sleep).and_return(nil)
      allow(Display.new).to receive(:display_main_menu).and_return(nil)
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
      allow(Display.new).to receive(:display_main_menu).and_return(nil)
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

  describe "#save_game" do
    it "acts on appropriate input" do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return(true)
      allow(@game).to receive(:puts).and_return(nil)
      allow(Display.new).to receive(:display_save_successful).and_return(false)
      allow(@game).to receive(:save_game).and_return(true)
      expect(@game.save_game).to be true
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