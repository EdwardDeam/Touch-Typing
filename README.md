# Keyboard Warrior 

Keyboard Warrior is a terminal game created in ruby whereby the user types in randomly generated greek philosopher quote.

## Contents
* [Build Process](#Build-Process)
* [Structure](#Structure)
* [Features](#Features)
* [Technical](#Technical)
* [Setup](#setup)
* [Interface](#Interface)
* [Authors](#Authors)
* [Master Repository](#Master-Repository)

# Build process
Our primary aim was to create a program that would test the users typing speed and accuracy testing them on  randomly generated quotes. It would check the original quote against the one that the user wrote and return an accuracy percentage and a total words per minute.
Our secondary goal was to save the users statistics between sessions.

# Structure

# Features
1. Pulls a selection of quotes from the Faker Gem.
2. Present the quotes one by one to the user and save get there attempt.
3. Run test to determine how many errors the user has.
4. Return the users total Words Per Minute and accuracy.
5. Save the user data between sessions.

# Technical
* Code was written in Ruby
* GEMS used:
* Faker
* Colorize

# Setup
```
gem install faker
gem install colorize
ruby start.rb
```

# Interface

Launch Menu - User chooses whether they want to play in Colourblind mode

![Colour](docs/Colourblind.png)


Game Menu

![Game](docs/StartGame.png)

Score for current session

![Result](docs/Results.png)

# Master Repository
https://github.com/EdwardDeam/Touch-Typing

# Authors
* Tony Xu
* Edward Deam
