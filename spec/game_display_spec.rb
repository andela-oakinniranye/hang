require_relative "spec_helper"

describe HangMan::Display do
  before :each do
    @disp = HangMan::Display.new  
  end

  it "should be an instance of the Display class" do
    expect(@disp).to be_an_instance_of HangMan::Display
  end

  describe "#main_menu" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :main_menu).to eql(true)
      expect(@disp.main_menu).to include("Type 'start' to Start")
    end
  end

  describe "#display_good_guess" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_good_guess).to eql(true)
      expect(@disp.display_good_guess).to include("CORRECT!")
    end
  end

  describe "#display_wrong_guess" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_wrong_guess).to eql(true)
      expect(@disp.display_wrong_guess).to include("INCORRECT! TRY AGAIN")
    end
  end

  describe "#display_load_successful" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_load_successful).to eql(true)
      expect(@disp.display_load_successful).to include("SUCCESSFUL")
    end
  end

  describe "#display_load_failed" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_load_failed).to eql(true)
      expect(@disp.display_load_failed).to include("FILE NOT FOUND!")
    end
  end

    describe "#display_save_successful" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_save_successful).to eql(true)
      expect(@disp.display_save_successful).to include("SAVE SUCCESSFUL!")
    end
  end

  describe "#display_load_successful" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_load_successful).to eql(true)
      expect(@disp.display_load_successful).to include("LOAD SUCCESSFUL!")
    end
  end

  describe "#display_good_game" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_good_game).to eql(true)
      expect(@disp.display_good_game).to include("CONGRATULATIONS!")
    end
  end

  describe "#display_save_continue" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_save_continue).to eql(true)
      expect(@disp.display_good_game).to include("SAVE SUCCESSFUL!!!")
    end
  end


  describe "#display_game_over" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_game_over).to eql(true)
      expect(@disp.display_game_over).to include("GAME-OVER!")
    end
  end
end


