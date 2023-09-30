require 'open-uri'

class GamesController < ApplicationController
  def new
    alphabet = ("A".."Z").to_a
    random_letters = []
    10.times do
      random_letters << alphabet.sample
      @letters = random_letters.join(' ')
    end
  end

  def score
    @guess = params[:guess].upcase

    @attempt = URI.open("https://wagon-dictionary.herokuapp.com/#{@guess}").read
    @word = JSON.parse(@attempt)

    # if @guess.chars.all? { |letter| @guess.length <= @letters.length }
    #   @result = "Sorry but #{@guess} can't be built out of #{@letters}"
    # elsif
    #   @result = "Sorry but this is not an english word"
    # else
    #   @result = "Congratulations!! #{@guess} is a valid english word"
    # end
  end
end
