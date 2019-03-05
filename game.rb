require 'date'
require_relative 'level.rb'

class Game
  attr_reader :level, :times, :total_errors
  attr_accessor :max_num_quotes

  def initialize(max_num_quotes = 2)
    @max_num_quotes = max_num_quotes
    @level = Level.new(max_num_quotes)
    @times = []
    @total_errors = 0
    ### TEMP
    @accuracy = 0
    @words_per_min = 0
  end

  def run
    level.quotes.each do |quote|   
       show_quote(quote)
       user_str = get_input
       errors = accuracy_comparison(quote, user_str)
       @accuracy = accuracy_percentage(errors, quote.length)
       #WPM
    end
  end

  def get_input
    # Function: Get and return the user input and capture the time the input took
    # and add it to an array that is passed in.
    # Save first Time Point (tp1) in a Time object.
    tp1 = Time.now
    # Get user input, remove the final character and save it as a string.
    input = gets.chomp
    # Save the Second Time Point (tp2) in a Time object.
    tp2 = Time.now
    # Find the time between the last and first time point and return the 
    # delta time in a float.
    delta = tp2 - tp1
    # Add the time to the time array that was passed in.
    times << delta
    # Return the input string.
    return input
  end

  def accuracy_comparison(original, user_string)
    # Function: Compare two strings and return the number of differences
    # as an integer.
    # Integer counter of total_errors
    total_errors = 0
    if(original == user_string)
      # If the two strings are a perfect match the return 0 total_errors.
      return total_errors
    end
    # Break the passed in strings by word into two arrays to make the data easier
    # to work with.
    original_arr = original.split
    user_string_arr = user_string.split
    # Loop the original array and compare to the user_string word by word.
    original_arr.each_with_index do |word, index|
      # If the words match then there is no need to cound total_errors so we can skip.
      next if word == user_string_arr[index]
      # Call letter_accuracy function to get total count of total_errors.
      total_errors += letter_accuracy(word, user_string_arr[index])
    end  
    # Return the total number of total_errors as an integer.
    return total_errors
  end

  def letter_accuracy(original, test)
    # Function: Take two strings and run two checks to determin the differences.
    # Returns the smaller ammount of total_errors, giving the user a fairer game.
    # Split the passed in strings into arrays of characters to make them easier
    # to work with.
    original_word = original.split("")
    test_word = test.split("")
    # Find the minimum number of total_errors by finding the difference in length
    # between the two arrays. eg "hello" vs "hellooo" would be a min of 2 
    # total_errors.
    length_error = test_word.length - original_word.length
    # Runs two tests, one to compare the index of each array with each other
    # (index_errors).
    # The other looks for the next letter needed and searches the array
    # until it finds it (letter_test_errors).
    letter_test_errors = 0
    index_errors = 0
    # leter_index is the index of the letter that is currently being searched for
    letter_index = 0
    # next_letter is the string to compare the search to
    next_letter = original_word[letter_index]
    # loop the original word running both tests simultaneously
    original_word.each_with_index do |letter, index|
      # Test to check if the index of each letter matches.
      if letter != test_word[index]
        # If the letters don't match then add one count to index total_errors.
        index_errors +=1
      end
      # Check if the letter needed is different from the next letter in the test
      # word
      if next_letter != test_word[index]
        # If the letter doesn't match then add an error to the letter text total_errors.
        letter_test_errors += 1
      else
        # If the characters matched then look for the next character in the
        # original string
        letter_index += 1
        next_letter = original_word[letter_index]
      end
    end
    # Find the smaller number of total_errors from the tests.
    test_errors = ([letter_test_errors, index_errors].min)
    # puts("#{test_errors} test error")
    # puts("#{length_error} min total_errors")
    # Return the greater of test_errors or min_errors
    test_errors < length_error ? length_error : test_errors
  end

  def accuracy_percentage(total_errors, stringlength)
    acc_percentage = (total_errors.to_f / stringlength.to_f) * 100
    return acc_percentage
  end

  def show_quote(quote_string)
    puts (quote_string)
  end
  
end