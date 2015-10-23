#Robot Simulation First Draft - Jerry Khalil

require 'pry'
DIRECTION = [:north, :east, :south, :west]
MOVEMENT = [:turn_right, :turn_left, :advance]

class Robot
  attr_accessor :bearing, :coordinates, :instructions
def initialize

  @coordinates = [0,0]
  @bearing = :north
  @instructions = []
  

  
end

def turn_right
  #starting_direction = DIRECTION.index(@bearing)
  @bearing = DIRECTION[(DIRECTION.index(@bearing) + 1) % 4]
end

def turn_left
  @bearing = DIRECTION[(DIRECTION.index(@bearing) - 1) % 4]
end

def at(*location)
  @coordinates.each_index do |index|
    @coordinates[index] = location[index]
  end
  #@coordinates.each do |index|
    #@coordinates[index] = @coordinates[index] + move_this_many[index]
  
end

def find_current_orientation(starting_direction)


  
end

def advance
  if @bearing == :north
    @coordinates[1]  += 1
  elsif @bearing == :south
    @coordinates[1] -=1
  elsif @bearing == :east
    @coordinates[0] +=1
  else
    @coordinates[0] -=1
  end

end

def turn(orientation)
  
end

def orient(direction)
  if DIRECTION.include?(direction)
    @bearing = direction
  else
    raise ArgumentError, "Invalid direction, must be north, south, east, or west"
  end
end


end

class  Simulator

  def initialize
    #@orders = []
  end

  def place(robot, x:, y:, direction:)

    robot.at(x,y)
    robot.orient(direction)

  end

  def evaluate(robot, movement_instructions)
    robot.instructions = instructions(movement_instructions)
    robot.instructions.each do |move|
      robot.method(move).call
     #binding.pry
    end
    
    
  end

  def instructions(turn_where)
    orders = []
    turn_where.each_char do |letter|
    if letter == 'L'
      selection = 1
    elsif letter == 'R'
      selection = 0
    else
      selection = 2
    end  
    orders << MOVEMENT[selection]
  end
  orders
  end


end