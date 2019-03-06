require 'faker'

class Level
  # Level objects will store the quotes to be typed, as well as provide
  # information about total num quotes and total num words that will be
  # used by other methods.
  attr_reader :quotes

  def initialize(number_quotes)
    # Populate the quotes array with new quotes
    @quotes = quote_generator(number_quotes)
  end

  def total_quotes
    @quotes.length
  end

  def total_words
    # Count the total number of words in all quotes in the array
    words = 0
    @quotes.each do |quote|
      temp_array = quote.split
      words += temp_array.length
    end
    return words
  end

  def quote_generator(total_quotes)
    quotes = []
    total_quotes.times do
      # Load random quotes from faker gem
      quotes << Faker::GreekPhilosophers.quote
    end
      return quotes
  end

end

# TESTS

# test_level = Level.new(5)
# puts test_level.total_words
# test_level.each do |quote|
#   puts quote
# end