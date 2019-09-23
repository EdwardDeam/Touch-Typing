# Level objects will store the quotes to be typed, as well as provide 
# information about the total number of quotes and total num words that will
# be used by other methods.

require 'faker'

class Level
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
    @quotes.flatten.split(' ').length
  end

  def quote_generator(number_quotes)
    Array.new(number_quotes) { Faker::GreekPhilosophers.quote }
  end

end
