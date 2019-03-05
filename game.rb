require_relative 'level.rb'
class Game
  attr_reader :level, :times, :errors
  attr_accessor :max_num_quotes

  def initialize(max_num_quotes = 2)
    @max_num_quotes = max_num_quotes
    @level level.new(max_num_quotes)
    @times = []
    @errors = 0
  end

  def run
  end

end