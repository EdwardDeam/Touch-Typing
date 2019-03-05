# require 'faker'
# require 'colorize'

  
def launch_screen
  #ASKS WHETHER YOU WANT TO PLAY IN COLOURBLIND MODE
  puts "*"*51
  puts "COLOURBLIND MODE? (Y/N)".center(51)
  puts "*"*51
  input = gets().strip.upcase
end
  
def main_menu 
  #DISPLAYS NON COLOURBLIND MENU
  puts "#{"*".light_blue}#{"*".cyan}#{"*".blue}"*17
  puts "1. START GAME". center(51).light_blue
  puts "2. EXIT".center(51).light_blue
  puts "#{"*".light_blue}#{"*".cyan}#{"*".blue}"*17
  input = gets().strip.upcase
  if (input == "1")
  #ENTER GAME START (NOT FINISHED)
  elsif (input == "2")
    return
  else
    puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50).red
    puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50).red
    puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50).red
    puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50).red
  end
end
  
def colourblind_menu
  #DISPLAYS COLOURBLIND MENU 
  puts "*"*51
  puts "1. START GAME".center(51)
  puts "2. EXIT".center(51)
  puts "*"*51
  input = gets().strip.upcase
  if (input == "1")
    #ENTER GAME START (NOT FINISHED)
  elsif (input == "2")
    return
  else
    puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50)
    puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50)
    puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50)
    puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50)
  end
end
  
def quote_generator(total_quotes)
    quotes = []
    total_quotes.times do
        quotes << Faker::GreekPhilosophers.quote
    end
    return quotes
end
  
  
def colourblind_mode
    program_running = (true)
    while(program_running)
      input = launch_screen
      if(input == "Y")
        return true
      
      elsif(input == "N")
        return false
        
      else
        puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50)
        puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50)
        puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50)
        puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50)
      end
    end
end
  
def program_launch
  if colourblind_mode
    colourblind_menu
  else
    main_menu
  end
end

def quote_generator(total_quotes)
  quotes = []
  total_quotes.times do
    quotes << Faker::GreekPhilosophers.quote
  end
    return quotes
end


#stage_1 generates the first stage of quotes ('Level 1')

def accuracy_comparison(original, user_string)
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
  # Find the minimum number of errors by finding the difference in length
  # between the two arrays. eg "hello" vs "hellooo" would be a min of 2 
  # errors.
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
  # Find the smaller number of errors from the tests.
  test_errors = ([letter_test_errors, index_errors].min)
  # puts("#{test_errors} test error")
  # puts("#{length_error} min errors")
  # Return the greater of test_errors or min_errors
  test_errors < length_error ? length_error : test_errors
end
test_str =      "Don't sweat the petty things and don't pet the sweaty things."
user_test_str = "Don't sweat the petty things and don't pet the sweaty things."
prefect_str =   "Don't sweat the petty things and don't pet the sweaty things."
# puts accuracy_comparison(test_str,user_test_str)

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

def show_quote(quote_string)
  puts (quote_string)
end

##########################################
# test_quotes = quote_generator(5)
test_quotes = ["Don't sweat the petty things and don't pet the sweaty things.","Don't sweat the petty things and don't pet the sweaty things."]
times = []
errors =0
test_quotes.each do |quote|
  show_quote(quote)
  input = get_input(times)
  errors += accuracy_comparison(quote, input)
  #Get Accuracy
  #Get WPM
end
puts("Total Time: #{times.sum}")
puts("Total Errors: #{errors}")


