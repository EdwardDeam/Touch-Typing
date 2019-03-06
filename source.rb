
require 'colorize'
require 'io/console'

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
    system 'clear'
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
    system 'clear'
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


def press_any_key()
  input = nil
  puts "Press any key to continue..."
  while(!input)
      input = STDIN.getch()
  end
  return input
end

####
is_running = true
system 'clear'
cb_mode = launch_screen
system 'clear'
name = get_user_name
current_user = User.new(name)

while is_running
  game = Game.new(5)
  menu_input = 0
  if (cb_mode == 'y')
    menu_input = colourblind_menu
  else
    menu_input = main_menu
  end
    
  case menu_input
  when 1
    system 'clear'
    game.run
    puts("Lifetime Words Per Minute: #{current_user.wpm}.")
    puts("Lifetime Accuracy: #{current_user.accuracy}%")
    puts "*"*51
    press_any_key
    current_user.add_wpm(game.words_per_min)
    current_user.add_accuracy(game.accuracy)
  when 2
    current_user.save_data
    is_running = false
    system 'clear'
  end
end
