require_relative "spec_helper"

  describe GamePlay do
    before :each do
    @game = GamePlay.new
  end


    it "should do something" do
      expect(@game.class).to eql(GamePlay)
    end

  end
