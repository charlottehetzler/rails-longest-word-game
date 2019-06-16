require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @alphabet = ('a'..'z').to_a
    @letters = 10.times.map { @alphabet.sample }
    @letters.join(', ').upcase
  end

  def score
    @word = params[:word]
    @grid = params[:grid].split
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    user_seralized = open(url).read
    user = JSON.parse(user_seralized)
    if user["found"]
      @answer = "Congratulations! #{@word} is a valid English word!"
    else
      @answer = "Sorry but #{@word} does not seem to be a valid English word"
    end
    @word.each_char do |letter|
      if !@grid.include?(letter)
        @answer = "Sorry but #{@word.upcase} can’t be built out of #{@grid.join(", ").upcase}"
      elsif @word.count(letter) > @grid.count(letter)
        @answer = "Sorry but #{@word.upcase} can’t be built out of #{@grid.join(", ").upcase}"
      end
   end
 end
end
