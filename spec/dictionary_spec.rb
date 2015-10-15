require_relative "spec_helper"

  describe HangMan::GamePlay do
    before :each do
    @game = HangMan::GamePlay.new
    @display = HangMan::Display.new 
    @save_load = HangMan::SaveLoad.new(@game)
    @dictionary = HangMan::Dictionary.new
  end

  describe "#read_dictionary" do

    it "should raise an ArgumentError error if no parameters are passed" do
      expect { @game.load_saved_game }.to raise_error(ArgumentError)
    end


    it "should be reay to do something" do 
      expect(@dictionary.read_dictionary("./lib/hangman/5desk.txt")).to be_a Array
    end
  end


  describe "#generate_word`" do

    it "should raise an ArgumentError error if no parameters are passed" do
      expect { @game.load_saved_game }.to raise_error(ArgumentError)
    end

    end
  end