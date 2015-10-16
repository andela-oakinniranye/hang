# require_relative "spec_helper"

#   describe HangMan::GamePlay do
#     let(:game) { HangMan::GamePlay.new }
#     let(:display) { HangMan::Display.new }
#     let(:save_load) { HangMan::SaveLoad.new(@game)}
#     let(:dictionary) {HangMan::Dictionary.new}

#   before :all do
#     FakeFS.activate!
#     FileUtils.mkdir_p('/tmp')
#     Dir.mkdir("./lib")  
#     Dir.mkdir("./lib/hangman")  
#     File.open("./lib/hangman/5desk.txt", "w+")
#     File.open("./lib/hangman/dictionary.txt", "w+")
#   end


#   after :all do
#     FakeFS.deactivate!
#   end

#   describe "#read_dictionary" do
#     it "should raise an ArgumentError error if no parameters are passed" do
#       expect { dictionary.read_dictionary }.to raise_error(ArgumentError)
#     end

#     File.open("oscar.txt", "w+") do |line|
#       line.puts ("o,s,c,a,r\n")
#       line.puts ("o,c,r\n")
#       line.puts ("_,s,_,a,_\n")
#       line.puts ("tabernacle")
#     end


#     it "should assign the values of the file to the tested variable" do 
#       dictionary.read_dictionary("oscar.txt")
#       expect(dictionary.word_array).to eql["o,s,c,a,r\n", "o,c,r\n", "_,s,_,a,_\n", "8\n"]
#     end
#   end

#   describe "#generate_word" do
#     it "should raise an ArgumentError error if no parameters are passed" do
#       expect { dictionary.read_dictionary }.to raise_error(ArgumentError)
#     end

#     File.open("oscar.txt", "w+") do |line|
#       line.puts ("o,s,c,a,r\n")
#       line.puts ("o,c,r\n")
#       line.puts ("_,s,_,a,_\n")
#       line.puts ("tabernacle")
#     end


#     it "should assign the values of the file to the tested variable" do 
#       dictionary.read_dictionary("oscar.txt")
#       expect(dictionary.word_array).to eql["o,s,c,a,r\n", "o,c,r\n", "_,s,_,a,_\n", "tabernacle"]
#     end
#   end


#   #   it "should be reay to do something" do 
#   #     expect(@dictionary.read_dictionary("./lib/hangman/5desk.txt")).to be_a Array
#   #   end
#   # end

 
  
# end


