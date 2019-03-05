class Level
  attr_reader :quotes
  def initialize()
    @quotes # = quote genertaino func
  end

  def total_quotes
    @quotes.length
  end

  def total_words
    words = 0
    @quotes.each do |quote|
      temp_array = quote.split
      words += temp_array.length
    end
    return words
  end
end