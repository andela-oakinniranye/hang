module HangMan
  class Dictionary


    def initialize
      read_dictionary("./lib/hangman/5desk.txt")
    end

    def read_dictionary(dictionary_file)
      @@word_array ||= File.readlines(dictionary_file)
    end

    def generate_word
        begin 
          word = @@word_array.sample.chomp.downcase.chars
        end until (word.length > 5 && word.length < 14)
      word
    end 

  end
end