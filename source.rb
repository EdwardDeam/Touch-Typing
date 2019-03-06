
require 'colorize'

require_relative 'game.rb'
require_relative 'level.rb'
require_relative 'user.rb'
  
def launch_screen
  #ASKS WHETHER YOU WANT TO PLAY IN COLOURBLIND MODE
  input = nil
  loop do
    puts "*"*51
    puts "COLOURBLIND MODE? (Y/N)".center(51)
    puts "*"*51
    input = gets().strip.downcase
    # puts input
      if (input == 'y' || input == 'n')
        break
      end
    # puts("#{input} is input")
  end
  return input
end
  
def get_user_name
  puts "Enter your name: "
  name = gets.strip.downcase
  return name
end

def main_menu 
  #DISPLAYS NON COLOURBLIND MENU
  loop do
    # system 'clear'
    puts "#{"*".light_blue}#{"*".cyan}#{"*".blue}"*17
    puts "1. START GAME". center(51).light_blue
    puts "2. EXIT".center(51).light_blue
    puts "#{"*".light_blue}#{"*".cyan}#{"*".blue}"*17
    input = gets.strip
    if (input == "1")
      return 1
    elsif (input == "2")
      return 2
    else
      puts "INVALID INPUT! SELECT 1 OR 2 PLEASE!".center(50).red
    end
  end 
end
  
def colourblind_menu
  #DISPLAYS COLOURBLIND MENU 
  loop do
    # system 'clear'
    puts "*"*51
    puts "1. START GAME". center(51)
    puts "2. EXIT".center(51)
    puts "*"*51
    input = gets.strip
    if (input == "1")
      return 1
    elsif (input == "2")
      return 2
    else
      puts "INVALID INPUT! SELECT 1 OR 2 PLEASE!".center(50)
    end
  end 
end
  
####
is_running = true
cb_mode = launch_screen

name = get_user_name
current_user = User.new(name)

while is_running
  game = Game.new()
  menu_input = 0
  if (cb_mode == 'y')
    menu_input = colourblind_menu
  else
    menu_input = main_menu
  end
    
  case menu_input
  when 1
    game.run
  when 2
    current_user.save_data
    is_running = false
    # system 'clear'
  end
end
