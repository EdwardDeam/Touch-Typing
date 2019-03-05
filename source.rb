require 'faker'
require 'colorize'

  
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

quote_length = quotes[]

def accuracy_percentage(errors, stringlength)
acc_percentage = (error.to_f / stringlength.to_f) * 100
return acc_percentage
end
#ACCURACY COUNTER



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
