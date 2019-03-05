require 'faker'
require 'colorize'

def menu
    puts "#{"*".light_blue}#{"*".cyan}#{"*".blue}"*17
  puts "1. START GAME". center(50).light_blue
  puts "2. EXIT".center(50).light_blue
  puts "#{"*".light_blue}#{"*".cyan}#{"*".blue}"*17
  input = gets.strip.to_i
end

def quote_generator(total_quotes)
    quotes = []
    total_quotes.times do
        quotes << Faker::GreekPhilosophers.quote
    end
    return quotes
end

def intialize
    program_running = (true)
    while(program_running)
      input = menu
      if(input == 1)
        #insert game loop here when made
      elsif(input == 2)
        break
      else
        puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50).red
        puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50).red
        puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50).red
        puts "DONT BREAK ME! PRESS 1 OR 2 PLEASE!".center(50).red
      end
    end
end

# def game_loop  ### NOT COMPLETED ( USE THIS TO MOVE INTO GAME START)
# end



#stage_1 generates the first stage of quotes ('Level 1')

# def accuracy_calculator(input, quote_generator)
# input = []
# quote = stage_1.split
# quote_to_array = quote.chars


# end
####### ABOVE = ACCURACY CALCULATOR, NOT COMPLETE

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
