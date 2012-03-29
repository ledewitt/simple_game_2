module SimpleGame
  class World  # better Game

    def initialize # Need the locations populated and a player with locations
    
      @locations = [ ]
      open("world.dat") do |f|
        location = { }
        f.each do |line|
          if line =~ /\A([A-Z]+):\s*(.+)\Z/
            location[$1.downcase] = $2
          elsif line !~ /\S/
            add_location(location)
             location.clear
          end
        end
        add_location(location)
      end
      @locations.each do |location|
        location.link_exits(@locations)
      end
    end
  
    attr_reader :locations
  
    private
  
    def add_location(location)
      return if location.empty?
      name = location['name']
      description = location['description']
      objects = location['objects']
      exits = location['exits']
    
      # raise "name, description and object are required" unless name and description and objects
                                                             
      @locations << Location.new(name, description, objects, exits)
    end
  end                                                             

  def interpret(command, bob)  # move into Game
    words = command.split(" ")
    case words.first
    when 'quit', 'exit'
      exit
    when 'look'
      bob.look
    when 'pickup', 'get'
      bob.pickup(words.last)
    when 'walk', 'run'
      bob.walk(words.last)
    when 'inventory'
      bob.inventory
    when 'dunk'
      bob.dunk
    when 'weld'
      bob.weld
    when 'splash'
      bob.splash
    else
      puts 'I do not recognize that command'
    end
  end

  def start  # move into Game
      puts "Would you like to play a game?"
      world = World.new
      bob = Player.new(world)
      bob.look
      while command = gets.strip
        interpret(command, bob)
      end
  end
end