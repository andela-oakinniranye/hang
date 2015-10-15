require_relative "spec_helper"

  describe HangMan::SaveLoad do
    before :each do
    @game = HangMan::SaveLoad.new(@game)
    @game_play = HangMan::GamePlay.new
    @display = HangMan::Display.new
  end


  it "should check if class exits" do
    expect(@game.class).to eql(HangMan::SaveLoad)
  end

  describe "#save_game" do
    before :each do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return(true)
    end

    it "acts on appropriate input" do
      allow(@game).to receive(:length).and_return(12)
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:save_game).and_return(true)
      expect(@game.save_game).to be true
    end
 
    it "acts on appropriate input" do
      allow(@game).to receive(:length).and_return(0)
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:save_game).and_return(true)
      expect(@game.save_game).to be true
    end
 
    it "acts on appropriate input" do
      allow(@game).to receive(:length).and_return(6)
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:save_game).and_return(true)
      expect(@game.save_game).to be true
    end
  end

  describe "#save_continue" do
    before :each do 
      allow(@game).to receive(:puts).and_return(nil)
    end


    it "acts on appropriate input" do
      allow(@game).to receive(:gets).and_return(nil)
      allow(@display).to receive(:display_save_successful).and_return(false)
      allow(@game).to receive(:save_game).and_return(true)
      expect(@game.save_game).to be true
    end

   it "acts on appropriate input" do
      allow(@game).to receive(:gets).and_return("q")
      allow(@game).to receive(:display_save_continue).and_return(nil)
      expect{@game.save_continue}.to raise_error SystemExit
    end
  end 
end


