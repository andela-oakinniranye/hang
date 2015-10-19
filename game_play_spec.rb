require_relative "spec_helper"

  describe HangMan::GamePlay do
    let(:game) { HangMan::GamePlay.new }
    let(:display) { HangMan::Display.new }
    let(:save_load) { HangMan::SaveLoad.new(@game)}
    let(:dictionary) {HangMan::Dictionary.new}
    

    describe "#visual_update" do
      it "should return true for appropriate method call" do
        allow(game).to receive(:game_play).and_return(true)
        allow(game).to receive(:puts).and_return(nil)
        game.instance_variable_set(:@word, ["t","a","b","e","r","n","a","c","l","e"])
        game.instance_variable_set(:@answer, ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"])
        game.instance_variable_set(:@guess, "n")
        game.visual_update
        expect(game.visual).to eql(["_", "_", "_", "_", "_", "n", "_", "_", "_", "_"])
        expect(game.visual_update).to be true
      end
    end

    describe "#game_play" do
      it "should return true for appropriate method call" do
        allow(game).to receive(:lives).and_return(1)
        allow(game.win_lose).to receive(:game_over).and_return(nil)
        allow(game).to receive(:remaining_letters).and_return([])
        allow(game).to receive(:word).and_return([])
        allow(game).to receive(:puts).and_return(nil)
        allow(game.win_lose).to receive(:overall_success).and_return(true)
        expect(game.game_play).to be true
      end
    


      it "should return true for appropriate method call" do
        allow(game).to receive(:lives).and_return(1)
        allow(game.win_lose).to receive(:game_over).and_return(nil)
        allow(game).to receive(:remaining_letters).and_return("abc")
        allow(game.win_lose).to receive(:overall_success).and_return(nil)
        allow(game).to receive(:gets).and_return("h")
        allow(game).to receive(:input_check).and_return(true)
        expect(game.game_play).to be true
      end


     it "should return true for appropriate method call" do
        allow(game).to receive(:lives).and_return(1)
        allow(game.win_lose).to receive(:game_over).and_return(nil)
        allow(game).to receive(:remaining_letters).and_return([])
        allow(game).to receive(:word).and_return([])
        allow(game.win_lose).to receive(:overall_success).and_return(true)
        allow(game).to receive(:gets).and_return(nil)
        allow(game).to receive(:input_check).and_return(nil)
        expect(game.game_play).to be true
      end

      it "should return true for appropriate method call" do
        allow(game).to receive(:lives).and_return(0)
        allow(game.win_lose).to receive(:game_over).and_return(true)
        expect(game.game_play).to be true
      end
    end


    describe "#save_quit" do
      before :each do 
        allow(game).to receive(:puts).and_return(nil)
        allow(display).to receive(:display_save_menu).and_return(nil)
      end

      it "should raise SystemExit error message" do
        allow(game).to receive(:gets).and_return("s")
        allow(game).to receive(:strip).and_return(nil)
        allow(game.game_save).to receive(:save_game).with(game).and_return(true)
        expect(game.save_quit).to be true
      end 

      it "should raise SystemExit error message" do
        allow(game).to receive(:gets).and_return("q")
        expect{game.save_quit}.to raise_error SystemExit
      end

    
      it "should return true for appropriate method call" do
        allow(game).to receive(:gets).and_return('l')
        allow(game).to receive(:downcase).and_return(nil)
        allow(game).to receive(:strip).and_return(nil)
        allow(game.game_save).to receive(:load_game).and_return(false)
        expect(game.save_quit).to be false
      end

       
      it "acts on load game option of the save_quit method" do
        allow(game).to receive(:gets).and_return("r")
        allow(game).to receive(:game_play).and_return(true)
        expect(game.save_quit).to be true
      end

       it "acts on load game option of the save_quit method" do
        allow(game).to receive(:gets).and_return("g")
        allow(game).to receive(:puts).and_return(nil)
        allow(game).to receive(:save_quit).and_return(true)
        expect(game.save_quit).to be true
      end
    end

    describe "#input_check" do
      before :each do 
        game.instance_variable_set(:@remaining_letters, ["t","a","b","e","r","n","a","c","l","e"])
      end

      it "should return true for the appropriate method call" do
        game.instance_variable_set(:@guess, "t")
        allow(game).to receive(:good_guess).and_return(true)
        expect(game.input_check).to be true
      end

      it "should return true for the appropriate method call" do
        game.instance_variable_set(:@guess, "2")
        allow(game).to receive(:puts).and_return(true)
        allow(game).to receive(:game_play).and_return(true)
        expect(game.input_check).to be true
      end

      it "should return true for the appropriate method call" do
        game.instance_variable_set(:@guess, "*")
        allow(game).to receive(:save_quit).and_return(true)
        expect(game.input_check).to be true
      end

      it "should return true for the appropriate method call" do
        game.instance_variable_set(:@guess, "w")
        allow(game).to receive(:wrong_guess).and_return(true)
        expect(game.input_check).to be true
      end
    end


    describe "#good_guess" do
      it "should return true for appropriate method call" do
        game.instance_variable_set(:@remaining_letters, ["t","a","b","e","r","n","a","c","l","e"])
        game.instance_variable_set(:@guess, "t")
        allow(display).to receive(:display_good_guess).and_return(true)
        allow(game).to receive(:puts).and_return(nil)
        allow(game).to receive(:display_lives).and_return(true) 
        allow(game).to receive(:visual_update).and_return(true)
        expect(game.good_guess).to be true
        expect(game.remaining_letters).to eql(["a","b","e","r","n","a","c","l","e"])
      end
    end


    describe "#wrong_guess" do
      it "should return true for appropriate method call" do
        game.instance_variable_set(:@lives, 4)
        allow(display).to receive(:display_good_guess).and_return(true)
        allow(game).to receive(:puts).and_return(nil)
        allow(game).to receive(:display_lives).and_return(true) 
        allow(game).to receive(:visual_update).and_return(true)
        expect(game.wrong_guess).to be true
        expect(game.lives).to eql(3)
      end
    end
  end