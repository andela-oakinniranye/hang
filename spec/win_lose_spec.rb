require_relative "spec_helper"

  describe HangMan::WinLose do
    let(:game_play) { HangMan::GamePlay.new }
    let(:display) { HangMan::Display.new }
    let(:save_load) { HangMan::SaveLoad.new(@game)}
    let(:game) {HangMan::WinLose.new(game_play, display)}

  describe "#overall_success" do
    before :each do 
      allow(display).to receive(:display_good_game).and_return(nil)
    end
    it "should return true for appropriate method call" do
      allow(game).to receive(:gets).and_return("y")
      allow(game_play).to receive(:get_user_input).and_return(true)
      expect(game.overall_success).to be true
    end
  

    it "should be able to return false for overall success" do
      allow(game).to receive(:gets).and_return("h")
      allow(game).to receive(:puts).and_return(true)
      allow(game).to receive(:overall_success).and_return(false)
      expect(game.overall_success).to be false
    end


    it "should raise system exit error" do
      allow(game).to receive(:gets).and_return("n")
      allow(game_play).to receive(:get_user_input).and_return(nil)
      expect{game.overall_success}.to raise_error SystemExit
    end
  end


  describe "#game_over" do
    before :each do
      allow(game).to receive(:puts).and_return(nil)
      allow(game_play).to receive(:word).and_return(%w[w o r d])
      allow(display).to receive(:display_game_over).and_return(nil)
    end


    it "should return true for appropriate method call" do  
      allow(game).to receive(:gets).and_return("y")
      allow(game_play).to receive(:get_user_input).and_return(true)
      expect(game.game_over).to be true
    end


    it "should raise system exit error" do
      allow(game).to receive(:gets).and_return("n")
      expect{game.game_over}.to raise_error SystemExit
    end


    it "should return true for appropriate method call" do
      allow(game).to receive(:gets).and_return("h")
      allow(game).to receive(:puts).and_return(nil)
      allow(game).to receive(:game_over).and_return(true)
      expect(game.game_over).to be true
    end
  end
end