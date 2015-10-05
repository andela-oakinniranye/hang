require_relative "spec_helper"

describe Display do
  before :each do
    @disp = Display.new  
  end

  it "should be an instance of the Display class" do
    expect(@disp).to be_an_instance_of Display
  end

  describe "#main_menu" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :main_menu).to eql(true)
    end
  end

  describe "#display_good_guess" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_good_guess).to eql(true)
    end
  end

  describe "#display_wrong_guess" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_wrong_guess).to eql(true)
    end
  end

  describe "#display_load_successful" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_load_successful).to eql(true)
    end
  end

  describe "#display_load_failed" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_load_failed).to eql(true)
    end
  end

    describe "#display_save_successful" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_save_successful).to eql(true)
    end
  end

  describe "#display_load_successful" do
    it "should be a method of the Display class" do
      expect(@disp.methods.include? :display_load_successful).to eql(true)
    end
  end
end


