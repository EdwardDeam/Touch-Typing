require 'faker'


def quote_generator(n)
    n.times do
        puts Faker::GreekPhilosophers.quote
    end
end

# stage_1 = quote_generator(10)

#stage_1 generates the first stage of quotes ('Level 1')

def accuracy_compare(original, user_string)
  if(original == user_string)
    puts "MATCH!"
    return 
  end
  original_arr = original.split("")
  user_string_arr = user_string.split("")
  # puts original_arr
  # puts user_string_arr
  errors = 0
  original_arr.each_with_index do |letter, index|
    if letter != user_string_arr[index]
      errors += 1
    end
  end
  puts errors
end

def accuracy_compare_two(original, user_string)
  # Function: Compare two strings and return the number of differences
  # as an integer.
  # Integer counter of errors
  errors = 0
  if(original == user_string)
    # If the two strings are a perfect match the return 0 errors.
    return errors
  end
  # Break the passed in strings by word into two arrays to make the data easier
  # to work with.
  original_arr = original.split
  user_string_arr = user_string.split
  # Loop the original array and compare to the user_string word by word.
  original_arr.each_with_index do |word, index|
    # If the words match then there is no need to cound errors so we can skip.
    next if word == user_string_arr[index]
    # Call letter_accuracy function to get total count of errors.
    errors += letter_accuracy(word, user_string_arr[index])
  end  
  # Return the total number of errors as an integer.
  return errors
end

def letter_accuracy(original, test)
  # Function: Take two strings and run two checks to determin the differences.
  # Returns the smaller ammount of errors, giving the user a fairer game.
  # Split the passed in strings into arrays of characters to make them easier
  # to work with.
  original_word = original.split("")
  test_word = test.split("")
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
      # If the letters don't match then add one count to index errors.
      index_errors +=1
    end
    # Check if the letter needed is different from the next letter in the test
    # word
    if next_letter != test_word[index]
      # If the letter doesn't match then add an error to the letter text errors.
      letter_test_errors += 1
    else
      # If the characters matched then look for the next character in the
      # original string
      letter_index += 1
      next_letter = original_word[letter_index]
    end
  end
  # Find the smaller number of errors and return to user.
  errors = [letter_test_errors, index_errors].min
  return errors
end
test_str =      "Don't sweat the petty things and don't pet the sweaty things."
user_test_str = "Don't sweat the petty things and don't pet the sweayy things."
prefect_str =   "Don't sweat the petty things and don't pet the sweaty things."
accuracy_compare_two(test_str,user_test_str)

# Require File
require 'date'

# Timing set up
def get_input(times_array)
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
  times_array << delta
  # Return the input string.
  return input
end
