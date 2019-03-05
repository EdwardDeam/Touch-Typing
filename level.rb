class Level
  # Level objects will store the quotes to be typed, as well as provide
  # information about total num quotes and total num words that will be
  # used by other methods.
  attr_reader :quotes

  def initialize(number_quotes)
    # Populate the quotes array with new quotes
    @quotes # = quote genertaino func
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

end