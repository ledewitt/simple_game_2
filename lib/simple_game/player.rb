module SimpleGame
  class Player
    
    def initialize(world)
      @location = world.locations.find { |l| l.name == "LIVING ROOM" }
      @inventory = ["BELLY_LINT"]
    end
  
    def look
      @location.full_description
    end
    
    def pickup(object)
      if obj = @location.object(object)
        @inventory << obj
        puts "You now have in your possesion a #{obj}."
      else
        puts "There is no #{object.upcase} in the room"
      end
    end
  
    def walk(direction)
      if new_location = @location.exit(direction)
        @location = new_location
      else
        puts "You can't go that wa!"
      end
      look
    end
  
    def inventory
      puts @inventory
    end
    
    # take the name of a room and return true if that's where the player currently is.
    
    def in?(room)
      room == @location.name
    end
    
    # take any number of object names as arguments and return true only if the player's inventory includes *all*
    
    def has?(*objects)
      objects.all? {|o| @inventory.include?(o)}
    end
  
    def dunk
      # Only if you have a chained bucket and are in the garden location
      
      if in?("GARDEN") && has?("CHAINED_BUCKET")
        puts "You now have a FULL_CHAINED_BUCKET"
        @inventory << "FULL_CHAINED_BUCKET"
        @inventory.delete("CHAINED_BUCKET")
      elsif @location == "GARDEN"
        puts "You have nothing to dunk in the well"
      else
        puts "You can't dunk here"
      end
    end
  
    def weld
      # Only if you have a bucket and a chain and are in the attic location
      
      if in?("ATTIC") && has?("BUCKET", "CHAIN")
        puts "You now have have a CHAINED_BUCKET"
        @inventory << "CHAINED_BUCKET"
        @inventory.delete("BUCKET")
        @inventory.delete("CHAIN")
      else
        puts "Nothing to weld with you knuckle head"
      end
    end
  
    def splash
      # Only if you have a full bucket and are in the living room
      
      if in?("LIVING ROOM") && has?("FULL_CHAINED_BUCKET")
        puts "The wizard awakens from his slumber and greets you warmly.  He hands you the magic low-carb donut you win! THE END"
      elsif @location == "LIVING_ROOM"
        puts "You have nothing to splash the wizard with."
      else
        puts "You can't splash here."
      end
    end
  end
end