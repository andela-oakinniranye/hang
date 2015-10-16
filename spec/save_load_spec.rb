require_relative "spec_helper"

  describe HangMan::SaveLoad do
    let(:obj) {HangMan::GamePlay.new}
    let(:game) { HangMan::SaveLoad.new(obj) }
    let(:display) { HangMan::Display.new }
    let(:dictionary) {HangMan::Dictionary.new}

  


  before :all  do
    FakeFS.activate!  
    FileUtils.mkdir_p("/tmp")
    Dir.mkdir("./lib")  
    Dir.mkdir("./lib/hangman")  
    File.open("./lib/hangman/5desk.txt", "w+")
    File.open("./lib/hangman/dictionary.txt", "w+")
  end

  after :all do
    FakeFS.deactivate!
  end


  describe "#save_game" do 

    it "should validate username for save file" do
      allow(game).to receive(:puts).and_return(nil)
      allow(game).to receive(:gets).and_return('oscar')
      allow(game).to receive(:puts).and_return(nil)
      allow(game).to receive(:save_data).and_return(true)
      expect(game.save_game).to be true
      expect(game.save_name).to eql("oscar.txt") 
    end

    it "should validate username for save file" do
      allow(game).to receive(:puts).and_return(nil)
      allow(game).to receive(:gets).and_return('')
      expect(game.save_game(nil, true)).to be nil
    end


    it "should validate username for save file" do
      allow(game).to receive(:puts).and_return(nil)
      allow(game).to receive(:gets).and_return('tabernacle')
      expect(game.save_game(nil, true)).to be nil
    end
  end

  describe "#save_data" do
    before :each do
      allow(game).to receive(:save_name).and_return("oscar.txt")
    end

    it "acts on appropriate input" do
      allow(game).to receive(:word).and_return(["o", "s", "c", "a", "r"])
      allow(game).to receive(:remaining_letters).and_return(["o","c","r"])
      allow(game).to receive(:answer).and_return(["_", "s", "_", "a", "_"])
      allow(game).to receive(:lives).and_return("8")
      allow(game).to receive(:save_game).and_return(true)
      allow(display).to receive(:display_save_successful).and_return(true)
      allow(game).to receive(:save_continue).with(game).and_return(true)
      expect(game.save_data(game)).to be true
    end

    it "reads the temporarily created file and compares the values" do
      temp_file = File.readlines("oscar.txt")
      expect(temp_file[0]).to eql("o,s,c,a,r\n")
      expect(temp_file[1]).to eql("o,c,r\n")
      expect(temp_file[2]).to eql("_,s,_,a,_\n")
      expect(temp_file[3]).to eql("8\n")
    end
  end


  describe "#save_continue" do
    before :each do 
      allow(game).to receive(:puts).and_return(nil)
      allow(display).to receive(:display_save_continue).and_return(nil)
    end


    it "acts on appropriate input" do
      allow(game).to receive(:gets).and_return("c")
      allow(obj).to receive(:visual_update).and_return(true)
      # allow(game).to receive(:save_game).and_return(true)
      expect(game.save_continue(obj)).to be true
    end

   it "acts on appropriate input" do
      allow(game).to receive(:gets).and_return("q")
      # allow(game).to receive(:display_save_continue).and_return(nil)
      expect{game.save_continue(obj)}.to raise_error SystemExit
    end
   

    it "acts on appropriate input" do
        allow(game).to receive(:gets).and_return("f")
        allow(obj).to receive(:exit_game).and_return(true)
        expect(game.save_continue(obj)).to be true
    end
  end

# ============================
#  describe "#load_game" do
#    File.open("oscar.txt", "w+") 

#     it "should return true for a successful method call" do    
#       allow(game).to receive(:puts).and_return(nil)
#       allow(game).to receive(:gets).and_return(nil)
#       allow(game).to receive(:load_username).and_return("oscar")
#       allow(obj).to receive(:load_saved_file).and_return(true)
#       # game.load_f
#       # allow(game).to receive(:continue_loaded_game).and_return(true)
#       expect(game.load_game(obj)).to be true
#       # expect(game.load_file).to eql(["oscar", "ocr", "_s_a_", "8"])
#     end
#   end
# # ====================
  describe "#load_failed" do
    it "should return true for a successful method call" do
      allow(game).to receive(:puts).and_return(nil)
      allow(game).to receive(:sleep).and_return(nil)
      allow(obj).to receive(:get_user_input).and_return(true)
      expect(game.load_failed(obj)).to be true
    end
  end

  describe "#load_saved_file" do
   File.open("oscar.txt", "w+") do |line|
      line.puts ("o,s,c,a,r\n")
      line.puts ("o,c,r\n")
      line.puts ("_,s,_,a,_\n")
      line.puts ("8\n")
    end

    it "should return true for a successful method call" do    
      allow(game).to receive(:load_username).and_return("oscar")
      allow(game).to receive(:continue_loaded_game).and_return(true)
      expect(game.load_saved_file).to be true
      expect(game.load_file).to eql(["oscar", "ocr", "_s_a_", "8"])
    end
  end

  describe "#continue_loaded_game" do
    it "should return true for a successful method call" do
      allow(game).to receive(:load_file).and_return(["oscar", "ocr", "_s_a_", "8"])
      allow(obj).to receive(:load_saved_game).and_return(true)
      expect(game.continue_loaded_game(obj)).to be true
      expect(game.word_loaded).to eql(["o", "s", "c", "a", "r"])
      expect(game.remaining_letters_loaded).to eql(["o", "c", "r"])
      expect(game.answer_loaded).to eql(["_", "s", "_", "a", "_"])
      expect(game.lives_loaded).to eql(8)
    end
  end
end 
# end
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
