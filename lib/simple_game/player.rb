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
      if @location.objects.delete(object.upcase)
        @inventory << object.upcase
        puts "You have now picked up the #{object.upcase}."
      else
        puts "There is no #{object.upcase} in the room."
      end
    end
  
    def walk(direction)
      # Change Bob's location on the world object
      if location = @location.exits[direction.upcase]
        @location = location
      else
        puts "Unknown direction."
      end
      look
    end
  
    def inventory
      puts @inventory
    end
  
    def dunk
      # Only if you have a chained bucket and are in the garden location
      if @location.name == "GARDEN" && @inventory.include?("CHAINED_BUCKET")
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
      if @location.name == "ATTIC" && @inventory.include?("BUCKET") && @inventory.include?("CHAIN")
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
      if @location.name == "LIVING ROOM" && @inventory.include?("FULL_CHAINED_BUCKET")
        puts "The wizard awakens from his slumber and greets you warmly.  He hands you the magic low-carb donut you win! THE END"
      elsif @location == "LIVING_ROOM"
        puts "You have nothing to splash the wizard with."
      else
        puts "You can't splash here."
      end
    end
  end
end