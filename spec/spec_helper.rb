# //require "coveralls"
# //Coveralls.wear!
require "simplecov"
SimpleCov.start
require "simplecov-shield"
require_relative "../lib/hangman/save_load.rb"
require_relative "../lib/hangman/game_display.rb"
require_relative "../lib/hangman/dictionary.rb"
require_relative "../lib/hangman.rb"


SimpleCov.formatter = SimpleCov::Formatter::ShieldFormatter