
require 'colorize'

require_relative 'level.rb'
require_relative 'game.rb'
  
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



app = Game.new()

app.run


