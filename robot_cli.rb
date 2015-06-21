require_relative './lib/world'

world = World.new

while true
puts "========================================"
puts "Welcome to ROBOT Command Line Interface"
puts "========================================"
puts "** The table is by default set to 5 x 5 **"
puts "The following command is available to use:"
puts "1. Place X,Y,F"
if world.robot
  puts "2. MOVE"
  puts "3. LEFT"
  puts "4. RIGHT"
  puts "5. REPORT"
end
puts "0. exit"
puts "-----------------------------------------------------"
print "run command: "
user_option = gets.chomp.upcase
case 
  when user_option[0..4] == 'PLACE'
    if user_option.split(' ')[1]
      input = user_option.split(' ')[1]
      input_x = input.split(',')[0].to_i
      input_y = input.split(',')[1].to_i
      input_f = input.split(',')[2]
      world.place(input_x, input_y, input_f)
    else
      puts "**** Please include an input with the PLACE command ****"
    end
  when user_option == 'MOVE'
    world.navigate_robot if world.robot
  when user_option == 'LEFT'
    world.robot.turn_left if world.robot
  when user_option == 'RIGHT'
    world.robot.turn_right if world.robot
  when user_option == 'REPORT'
    puts "*********************************"
    puts "REPORT: "
    puts world.robot.report if world.robot
    puts "*********************************"
  when user_option =='EXIT'
    break
  else
    puts "please type in the correct command"
  end
end