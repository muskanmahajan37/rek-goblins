require './lib/battle'
require './lib/fighter'
require './lib/player'
require './lib/enemy'

def ws
  puts "\n"
end

def header
  system 'clear'
  puts "The Title of it and random ascii things"
  ws
  puts "TEST YOUR MIGHT"
  puts "How many goblins can you rek"
  ws
end

def main_menu
  header
  puts "N > New Game"
  puts "X > Exit"
  ws
  main_choice = gets.chomp.upcase
  if main_choice == "N"
    new_game
  elsif main_choice == "X"
    exit
  else
    system 'clear'
    puts "Invalid input! Try again"
  end
end

def new_game
  header
  puts "What is your name, brave warrior?"
  @player = Player.new(gets.chomp)
  @enemy = Enemy.new()
  @battle = Battle.new(@player, @enemy)
  new_battle(@battle)
end

def messages
  if @player.turn
    puts @player.name + "'s turn."
  else
    puts @enemy.name + "'s turn."
  end
  ws
end

def enemy_pic
 puts "
             ,      ,\r\n            \/(.-\"\"-.)\\\r\n        |\\  \\\/      \\\/  \/|\r\n        | \\ \/ =.  .= \\ \/ |\r\n        \\( \\   o\\\/o   \/ )\/\r\n         \\_, \'-\/  \\-\' ,_\/\r\n           \/   \\__\/   \\\r\n           \\ \\__\/\\__\/ \/\r\n         ___\\ \\|--|\/ \/___\r\n       \/`    \\      \/    `\\\r\n      \/       \'----\'       \\
   "
end

def player_pic

end

def enemy_status
  puts @enemy.name
  puts "HP: " + @enemy.current_health.to_s + "/" + @enemy.maximum_health.to_s
  puts "AP: " + @enemy.power.to_s
  puts "LVL: " + @enemy.level.to_s
end

def player_status
  puts @player.name
  puts "HP: " + @player.current_health.to_s + "/" + @player.maximum_health.to_s
  puts "AP: " + @player.power.to_s
  puts "LVL: " + @player.level.to_s
end

def new_battle battle
  header
  messages
  enemy_pic
  enemy_status
  ws
  ws
  player_pic
  player_status

end

main_menu

